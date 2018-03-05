//
//  BinaryTree.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 3. 2..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

public indirect enum BinaryTree<T> {
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
}

extension BinaryTree {
    public var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [\(left.description)], right = [\(right.description)]"
        case .empty:
            return ""
        }
    }
}


public class BinaryTreeNode<T> {
    public var value: T
    public weak var parent: BinaryTreeNode<T>?
    public var left: BinaryTreeNode<T>?
    public var right: BinaryTreeNode<T>?
    var queue = Array<BinaryTreeNode<T>>()
    init(value: T, left: BinaryTreeNode<T>? = nil, right: BinaryTreeNode<T>? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    public var count: Int {
        var result = 0
        guard left != nil, right != nil else {
            return result
        }
        
        result += left!.count
        result += right!.count
        
        return result + 1
    }
}

extension BinaryTreeNode {
    public func traverseLevelOrder() {
        queue.append(self)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            print(node.value)
            if let leftNode = node.left {
                queue.append(leftNode)
            }
            if let rightNode = node.right {
                queue.append(rightNode)
            }
        }
    }
    
    public func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    public func traverseInOrder(process: (T) -> Void) {
        left?.traversePreOrder(process: process)
        process(value)
        right?.traversePreOrder(process: process)
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
        process(value)
    }
}

extension BinaryTreeNode: CustomStringConvertible {
    public var description: String {
        var desc = "{ value: \(value)(\(count)), left = "
        if let leftNode = left {
            desc += "[\(leftNode.description)](\(leftNode.count))"
        } else {
            desc += "[]"
        }
        desc += ", right = "
        if let rightNode = right {
            desc += "[\(rightNode.description)](\(rightNode.count))"
        } else {
            desc += "[]"
        }
        desc += "}\r\t"
        return desc
    }
    
//    func foo() {
//        var desc = ""
//        var carageReturn = "\r"
//        var tab = "\t"
//        if self.parent == nil {
//            desc += "value: \(self.value),\r\t"
//        }
//    }
}

/*
 ((1 + 2) / a) * (10 * b)
 { value: *,
    left: [{ value: /,
                left: [{ value: +,
                        left: [{ value: 1, left: [], right: []}],
                        right: [{ value: 2, left: [], right: []}], }],
                right: [{ value: a, left: [], right: []}], }],
    right: [{ value: *,
                left: [{ value: 10, left: [], right: []}],
                right: [{ value: b, left: [], right: []}], }],
 }
 */
extension BinaryTreeNode where T: Equatable {
    public func search(_ value: T) -> BinaryTreeNode<T>? {
        if value == self.value {
            return self
        } else {
            if let leftNode = left {
                if let found = leftNode.search(value) {
                    return found
                }
            }
            if let rightNode = right {
                if let found = rightNode.search(value) {
                    return found
                }
            }
            return nil
        }
    }
}
