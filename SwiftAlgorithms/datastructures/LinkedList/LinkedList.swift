//
//  LinkedList.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 2. 28..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    init(value: T) {
        self.value = value
    }
}


class LinkedList<T> {
    typealias Node = LinkedListNode<T>
    private var head: Node?
    var isEmpty: Bool {
        return head == nil
    }
    var first: Node? {
        return head
    }
    var last: Node? {
        guard var node = head else {
            print("have no head")
            return nil
        }
        print("last() head node: \(node.value)")
        while let next = node.next {
            node = next
        }
        print("last() last node: \(node.value)")
        return node
//        var result: Node? = head
//        while result != nil && result!.next != nil {
//            result = result!.next
//        }
//        return result
    }
    
    func append(_ value: T) {
        print("\(#function) value: \(value)")
        let newNode = Node(value: value)
        append(newNode)
    }
    
    // O(1)
    func append(_ node: Node) {
        print("\(#function) node: \(node.value)")
        let newNode = node
        if let lastNode = last {
            lastNode.next = newNode
            newNode.previous = lastNode
            print("before lastNode.value:: \(lastNode.value), new lastNode.value: \(newNode.value)")
        } else {
            head = newNode
        }
    }
    
    // O(n)
    func append(_ list: LinkedList) {
        print("\(#function) list")
        print("list[0]: \(list[0])")
        print("list[1]: \(list[1])")
        print("list[2]: \(list[2])")
        print("list.head: \(list.head?.value), list.last: \(list.last?.value)")
        print("list.head.next: \(list.head?.next?.value), next.next: \(list.head?.next?.next?.value), next.next.next: \(list.head?.next?.next?.next?.value)")
        var nodeToCopy = list.head
        while let node = nodeToCopy {
            print("append(list).node: \(node.value)")
            self.append(node.value)
            nodeToCopy = node.next
        }
    }
    
    // O(n) -> O(1)
    // 필요할 때 계산하지 않고, append, remove 할 때 계산하면 된다.
    var count: Int {
        guard var node = head else {
            return 0
        }
        var count: Int = 0
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    // O(n)
    func node(at index: Int) -> Node {
        print("\(#function) index: \(index)")
        assert(!isEmpty, "비어있음")
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
            // index 가 범위를 벗어난 경우 아래에서 강제추출시 error 발생
            return node!
        }
    }
    
    subscript(_ index: Int) -> T {
        let node = self.node(at: index)
        return node.value
    }
    
    // O(1)
    func insert(_ value: T, at index: Int) {
        print("\(#function) value: \(value), index: \(index)")
        let node = Node(value: value)
        insert(node, at: index)
    }
    
    func insert(_ node: Node, at index: Int) {
        print("\(#function) value: \(node.value), index: \(index)")
        let newNode = node
        if index == 0 {
            // 이 경우에 한해서 O(1)
            head?.previous = newNode
            newNode.next = head
            head = newNode
        } else {
            // 여기에서는 O(n)
            let prev = self.node(at: index - 1)
            let next = prev.next
            
            newNode.previous = prev
            newNode.next = next
            prev.next = newNode
            next?.previous = newNode
        }
    }
    
    // O(n)
    func insert(_ list: LinkedList, at index: Int) {
        print("\(#function) index: \(index)")
        if list.isEmpty {
            print("served list is empty")
            return
        }
        if index == 0 {
            list.last?.next = head
            head = list.head
        } else {
            let prev = self.node(at: index)
            let next = prev.next
            list.head?.previous = prev
            list.last?.next = next
            prev.next = list.head
            next?.previous = list.last?.next
        }
    }
    
    func removeAll() {
        head = nil
    }
    
    // O(1)
    func remove(_ node: Node) -> T {
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
        return node.value
    }
    
    func removeLast() -> T {
        assert(!isEmpty, "비어있음")
        return remove(last!)
    }
    
    func remove(at index: Int) -> T {
        let node = self.node(at: index)
        return self.remove(node)
    }
}











