//
//  LinkedList2.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 3. 1..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

public final class LinkedList2<T> {
    
    public class LinkedListNode2<T> {
        var value: T
        var next: LinkedListNode2?
        weak var previous: LinkedListNode2?
        init(value: T) {
            self.value = value
        }
    }
    
    public typealias Node = LinkedListNode2<T>
    
    fileprivate var head: Node?
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    fileprivate var internalCount: Int = 0
    public var count: Int {
        return self.internalCount
    }
    
    public func isEmpty() -> Bool {
        return head == nil
    }
    
    public func append(_ value: T) {
        let newNode = Node(value: value)
        self.append(newNode)
    }
    
    public func append(_ node: Node) {
        if let lastNode = last {
            lastNode.next = node
            node.previous = lastNode
        } else {
            head = node
        }
        internalCount += 1
    }
    
    public func append(_ list: LinkedList2) {
        var nodeToAppending = list.first
        while let next = nodeToAppending {
            self.append(next.value)
            nodeToAppending = next.next
        }
    }
    
    public func insert(_ value: T, at index: Int) {
        let newNode = Node(value: value)
        self.insert(newNode, at: index)
    }
    
    public func insert(_ node: Node, at index: Int) {
        if index == 0 {
            head?.previous = node
            node.next = head
            head = node
        } else {
            let prev = self.node(at: index - 1)
            let next = prev.next
            
            prev.next = node
            node.previous = prev
            node.next = next
            next?.previous = node
            
        }
        internalCount += 1
    }
    
    public func insert(_ list: LinkedList2, at index: Int) {
        if list.isEmpty() {
            print("served list is empty")
            return
        }
        if index == 0 {
            list.last?.next = head
            head?.previous = list.last
            head = list.head
        } else {
            let prev = self.node(at: index)
            let next = prev.next
            
            prev.next = list.first
            list.first?.previous = prev
            list.last?.next = next
            next?.previous = list.last
        }
        internalCount += list.count
    }
    
    public func removeAll() {
        head = nil
        internalCount = 0
    }
    
    @discardableResult public func remove(_ node: Node) -> T? {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        internalCount -= 1
        return node.value
    }
    
    @discardableResult public func removeLast() -> T? {
        assert(!isEmpty(), "this list(\(self)) has no node")
        return self.remove(last!)
    }
    
    @discardableResult public func remove(at index: Int) -> T? {
        let node = self.node(at: index)
        return remove(node)
    }
    
    public func node(at index: Int) -> Node {
        assert(!isEmpty(), "this list(\(self)) has no node")
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node!
        }
    }
    
}

// convenience
extension LinkedList2 {
    public subscript(_ index: Int) -> Node {
        return node(at: index)
    }
    
    public func reverse() {
        var node = head
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.previous, &currentNode.next)
            head = currentNode
        }
    }
    
    public func map<U>(_ transform: (T) -> U) -> LinkedList2<U> {
        let result = LinkedList2<U>()
        var node = head
        while node != nil {
            result.append(transform(node!.value))
            node = node!.next
        }
        return result
    }
    
    public func filter(predicate: (T) -> Bool) -> LinkedList2<T> {
        let result = LinkedList2<T>()
        var node = head
        while node != nil {
            let value = node!.value
            if predicate(value) {
                result.append(value)
            }
            node = node!.next
        }
        return result
    }
    
    
    convenience init(array: Array<T>) {
        self.init()
        for element in array {
            append(element)
        }
    }
}

extension LinkedList2: ExpressibleByArrayLiteral {
    public convenience init(arrayLiteral elements: T...) {
//        self.init(array: elements)
        self.init()
        for element in elements {
            print("element: \(element)")
            append(element)
        }
    }
}


extension LinkedList2: CustomStringConvertible {
    public var description: String {
        var desc: String = "[ "
        var node = head
        while node != nil {
            desc += "\(node!.value)"
            node = node!.next
            if node != nil {
                desc += ", "
            }
        }
        desc += " ]"
        return desc
    }
}

extension LinkedList2: Sequence {
    public func makeIterator() -> AnyIterator<Node> {
        var arr = [Node]()
        var node = head
        while node != nil {
            arr.append(node!)
            node = node!.next
        }
        return AnyIterator(IndexingIterator(_elements: arr))
    }
}

