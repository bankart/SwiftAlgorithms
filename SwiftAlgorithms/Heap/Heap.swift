//
//  Heap.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 3. 20..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

/*
 Heap
 - complete binary tree
 - has max/min heap property(parent always bigger/smaller than child)
 */
struct Heap<T> {
    
    // heap 의 노드를 저장할 배열
    var nodes = [T]()
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    var count: Int {
        return nodes.count
    }
    
    // comparing method
    private var orderCriteria: (T, T) -> Bool
    
    // create empty heap
    // @escaping: (T, T) -> Bool is called after return initializer. so use @escaping
    init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        // node[i]'s left child = node[(i * 2) + 1], right child = node[(i * 2) + 2]
        // child node's parent = node[(i-1)/2]
        // start heapify from last node(has child leaf is a node) to root
        for i in stride(from: (nodes.count-1)/2, through: 0, by: -1) {
            shiftDown(i)
        }
    }
    
    // @inline(__always): 작업을 함수 내부에서 마무리하게 한다.
    // 간단하고 빈번하게 일어나는 작업은 해당 함수 내부에서 모두 처리하도록 하여 속도가 빠른 장점이 있으나 함수 내부 작업이 길어지면 오히려 속도가 떨어진다.
    @inline(__always) func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1)/2
    }
    
    @inline(__always) func leftChildIndex(ofIndex i: Int) -> Int {
        return (2 * i) + 1
    }
    
    @inline(__always) func rightChildIndex(ofIndex i: Int) -> Int {
        return (2 * i) + 2
    }
    
    func peek() -> T? {
        return nodes.first
    }
    
    mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }
    
    mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else { return }
        remove(at: i)
        insert(value)
    }
    
    @discardableResult
    mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
        
    }
    
    @discardableResult
    mutating func remove(at index: Int) -> T? {
        guard !nodes.isEmpty else { return nil }
        
        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
    }
    
    mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        nodes[childIndex] = child
    }
    
    
    /// 선택된 node index 부터 nodes.count 까지 재귀적으로 orderCriteria 에서 정한 순서로 heapify 하는 함수
    /// max heap property 라면 left/right 자식중 큰 녀석이 있다면 node index 자신과 위치 교환
    /// min heap property 라면 자식들 중 작은 녀석이 node index 자신가 위치 교환
    ///
    /// - Parameters:
    ///   - index: heapify 시작할 위치
    ///   - endIndex: heapify 종료할 위치
    mutating func shiftDown(from index: Int, until endIndex: Int) {
        /*
         만약 max heap 이고, index == 4{6}, endIndex = 11 이면
         block(
         leftChildIndex = 9{4}
         rightChildIndex = 10{30}
         first = 4
         if 9 < 11 && 6 > 4 -> false
         if 10 < 11 && 30 > 6 -> first = 10
         if 10 == 4 false
         nodes.swapAt(4, 10)
         shiftDown(10, 11) > block 반복
         )
         */
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[index]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[index]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    
    /// 어차피 index 부터 nodes.count 까지 재귀적으로 heapify 해야하기 때문에 편의를 위한 메서드를 추가함
    ///
    /// - Parameter index: heapfy 시작할 index
    mutating func shiftDown(_ index: Int) {
        // index 부터 nodes.count 까지 heapfy
        shiftDown(from: index, until: nodes.count)
    }
}

extension Heap where T: Equatable {
    func index(of node: T) -> Int? {
        return nodes.index(where: { $0 == node })
    }
    
    @discardableResult
    mutating func remove(node: T) -> T? {
        if let index = index(of: node) {
            return remove(at: index)
        }
        return nil
    }
}






struct Heap2<T> {
    
    public typealias Comparator = (T, T) -> Bool
    var elements: [T] = []
    private var __isOrderedBefore: Comparator
    public var peak: T? { return elements.first }
    public var count: Int { return elements.count }
    public var isEmpty: Bool { return elements.isEmpty  }
    
    public init(comparator: @escaping Comparator) {
        __isOrderedBefore = comparator
    }
    
    public init(array:[T], comparator: @escaping Comparator) {
        __isOrderedBefore = comparator
        buildHeap(from:array)
    }
    
    @inline(__always) private func parent(of i: Int) -> Int? {
        guard i > 0 else { return nil }
        return (i - 1) / 2
    }
    
    @inline(__always) private func leftChild(of i: Int) -> Int? {
        if case let c = (i * 2) + 1, c < elements.count { return c }
        return nil
    }
    
    @inline(__always) private func rightChild(of i: Int) -> Int? {
        if case let c = (i * 2) + 2, c < elements.count { return c }
        return nil
    }
    
    @inline(__always) private mutating func swapElement(_ a: Int, _ b: Int) {
        (elements[a], elements[b]) = (elements[b], elements[a])
    }
    
    @inline(__always) private func isOrderedBefore(_ a: Int, _ b: Int) -> Bool {
        return __isOrderedBefore(elements[a], elements[b])
    }
    
    private mutating func shiftUp(at _i: Int) {
        var i = _i
        while let p = parent(of: i), isOrderedBefore(i, p) {
            swapElement(i, p)
            i = p
        }
    }
    
    mutating func add(_ e: T) {
        elements.append(e)
        shiftUp(at:elements.count - 1)
    }
    
    mutating func buildHeap(from arr: [T]) { arr.forEach{ add($0) } }
    
    private func availableChild(at i: Int) -> Int? {
        guard let l = leftChild(of: i) else { return nil }
        if let r = rightChild(of: i) {
            let x = isOrderedBefore(l, r) ? l : r
            return isOrderedBefore(x, i) ? x : nil
        }
        return isOrderedBefore(l, i) ? l : nil
    }
    
    private mutating func shiftDown(at _i: Int) {
        var i = _i
        while case let c? = availableChild(at:i) {
            swapElement(i, c)
            i = c
        }
    }
    
    mutating func remove() -> T? {
        guard !isEmpty else { return nil }
        let result = elements[0]
        let r = elements.removeLast()
        if !elements.isEmpty {
            elements[0] = r
            shiftDown(at:0)
        }
        return result
    }
}

