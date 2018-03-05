//
//  Tree.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 3. 2..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation


public class TreeNode<T> {
    public var value: T
    public weak var parent: TreeNode?
    public var children = [TreeNode<T>]()

    public init(value: T) {
        self.value = value
    }

    public func addChild(_ node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        var desc = "\(value)"
        if !children.isEmpty {
            desc += ": { \(children.map{ $0.description }.joined(separator: ", "))}"
        }
        return desc
    }
}

extension TreeNode where T: Equatable {
    public func search(_ value: T) -> TreeNode? {
        if value == self.value {
            return self
        } else {
            for child in children {
                if let found = child.search(value) {
                    return found
                }
            }
            return nil
        }
    }
}
