//
//  SwiftAlgorithmsTests.swift
//  SwiftAlgorithmsTests
//
//  Created by taehoon lee on 2018. 2. 28..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import XCTest
@testable import SwiftAlgorithms

class SwiftAlgorithmsTests: XCTestCase {
    var linkedList: LinkedList<String>!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        linkedList = LinkedList<String>()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLinkedList() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        print("linkedList.isEmpty: \(linkedList.isEmpty)") // true
        print("linkedList.first: \(linkedList.first)") // nil
        linkedList.append("Hello")
        print("linkedList.isEmpty: \(linkedList.isEmpty)") // false
        print("linkedList.first: \(linkedList.first!.value)") // Hello
        print("linkedList.last: \(linkedList.last!.value)") // Hello
//        linkedList.append("World")
        var node = LinkedListNode(value: "World")
        linkedList.append(node)
        print("linkedList.first: \(linkedList.first!.value)") // Hello
        print("linkedList.last: \(linkedList.last!.value)") // World
        print("linkedList.first!.previous: \(linkedList.first!.previous)") // nil
        print("linkedList.first!.next!.value: \(linkedList.first!.next!.value)") //World
        print("linkedList.last!.previous!.value: \(linkedList.last!.previous!.value)") // Hello
        print("linkedList.last!.next: \(linkedList.last!.next)") // nil
        print("linkedList.count: \(linkedList.count)")
        print("linkedList.node(at: 0).value: \(linkedList.node(at: 0).value)")
        print("linkedList.node(at: 1).value: \(linkedList.node(at: 1).value)")
//        print("linkedList.node(at: 2).value: \(linkedList.node(at: 2).value)") // crash
        linkedList.insert("Swift", at: 1)
        print("linkedList[0]: \(linkedList[0])")
        print("linkedList[1]: \(linkedList[1])")
        print("linkedList[2]: \(linkedList[2])")
        linkedList.remove(at: 1)
        node = LinkedListNode(value: "'Swift'")
        linkedList.insert(node, at: 1)
        print("linkedList[0]: \(linkedList[0])")
        print("linkedList[1]: \(linkedList[1])")
        print("linkedList[2]: \(linkedList[2])")
    }
    
    func testLinkedList2() {
        print("\n\n\(#function)")
        let list0 = LinkedList<String>()
        list0.append("0")
        list0.append("1")
        list0.append(LinkedListNode(value: "2"))
        print("================================")
        
        print("list0[0]: \(list0[0])")
        print("list0[1]: \(list0[1])")
        print("list0[2]: \(list0[2])")
        
        let list1 = LinkedList<String>()
        list1.append(list0)
        
        print("================================")
        
        let list2 = LinkedList<String>()
        list2.append("10")
        list2.append("11")
        list2.append("12")
        
        list1.insert(list2, at: 1)
        
        print("list1[0]: \(list1[0])")
        print("list1[1]: \(list1[1])")
        print("list1[2]: \(list1[2])")
        print("list1[3]: \(list1[3])")
        print("list1[4]: \(list1[4])")
        print("list1[5]: \(list1[5])")
        
        print("\(#function)\n\n")
    }
    
    func testLinkedList3() {
        let list: LinkedList2<String> = ["0", "1", "2", "3"]
//        for node in list {
//            print("node: \(node.value)")
//        }
        print("list.count: \(list.count)")
        print("====================================")
//        list.reverse()
//        for node in list {
//            print("reverse().node: \(node.value)")
//        }
        
        list.remove(at: 1)
        print("list.count: \(list.count)")
        print("list: \(list)")
        list.removeLast()
        print("list.count: \(list.count)")
        print("list: \(list)")
        list.append("100")
        print("list.count: \(list.count)")
        print("list: \(list)")
        list.insert("50", at: list.count - 1)
        print("list.count: \(list.count)")
        print("list: \(list)")
        let modifiedList = list.map{ "{\($0)}" }
        print("list: \(modifiedList)")
    }
    
    func testLinkedList4() {
        let list = LinkedList3<Int>()
        list.append(0)
        list.append(1)
        list.append(2)
        list.append(3)
//        print("\n")
//        for i in 0..<list.count {
//            print("list[\(i)]: \(list[i])")
//        }
        list.insert(-1, at: 0)
//        print("list.last: \(list.last!.value), tail: \(list.tail!.value)")
//        print("\n")
        list.append(100)
//        for i in 0..<list.count {
//            print("list[\(i)]: \(list[i])")
//        }
//        print("list.last: \(list.last!.value), tail: \(list.tail!.value)")
//        print("\n")
        list.insert(30, at: list.count-1)
//        for i in 0..<list.count {
//            print("list[\(i)]: \(list[i])")
//        }
//        print("list.last: \(list.last!.value), tail: \(list.tail!.value)")
//        print("\n")
        
        let newList = LinkedList3<Int>()
        for i in stride(from: 10, to: 30, by: 6) {
            newList.append(i)
        }
//        for i in 0..<newList.count {
//            print("newList[\(i)]: \(newList[i])")
//        }
        
        print("\n")
//        list.append(newList)
////        print("list.head: \(list.head!.value), first: \(list.first!.value)")
////        print("list.last: \(list.last!.value), tail: \(list.tail!.value)")
//        for i in 0..<list.count {
//            print("list[\(i)]: \(list[i])")
//        }
////        print("list.last: \(list.last!.value), tail: \(list.tail!.value)")
        
        list.insert(newList, at: list.count - 2)
//        for i in 0..<list.count {
//            print("list[\(i)]: \(list[i])")
//        }
//        print("\n")
        
        list.remove(list.node(at: 1))
//        for i in 0..<list.count {
//            print("list[\(i)]: \(list[i])")
//        }
//        print("\n")
        
        list.remove(at: 0)
//        for i in 0..<list.count {
//            print("list[\(i)]: \(list[i])")
//        }
//        print("\n")
        
        list.removeLast()
        for i in 0..<list.count {
            print("list[\(i)]: \(list[i])")
        }
        print("\n")
        
        list.reverse()
        print("list.head: \(list.head!.value), tail: \(list.tail!.value)")
        for i in 0..<list.count {
            print("list[\(i)]: \(list[i])")
        }
        print("\n")
        print(list)
        print("startIndex: \(list.startIndex)")
        print("endIndex: \(list.endIndex)")
        let secondIndex = list.index(after: list.startIndex)
        print("secondIndex: \(secondIndex)")
        print("")
        print("\n")
    }
    
    func testTree() {
        let tree = TreeNode<String>(value: "Beverages")
        let hotNode = TreeNode<String>(value: "Hot")
        let coldNode = TreeNode<String>(value: "Cold")
        tree.addChild(hotNode)
        tree.addChild(coldNode)
        
        let teaNode = TreeNode<String>(value: "Tea")
        hotNode.addChild(teaNode)
        teaNode.addChild(TreeNode<String>(value: "Black"))
        teaNode.addChild(TreeNode<String>(value: "Green"))
        teaNode.addChild(TreeNode<String>(value: "Chai"))
        
        let coffeeNode = TreeNode<String>(value: "Coffee")
        hotNode.addChild(coffeeNode)
        
        let chocolateNode = TreeNode<String>(value: "Cocoa")
        hotNode.addChild(chocolateNode)
        
        let sodaNode = TreeNode<String>(value: "Soda")
        coldNode.addChild(sodaNode)
        sodaNode.addChild(TreeNode<String>(value: "Ginger Ale"))
        sodaNode.addChild(TreeNode<String>(value: "Bitter Lemon"))
        
        let milkNode = TreeNode<String>(value: "Milk")
        coldNode.addChild(milkNode)
        
        print("\n\n")
        print(tree)
//        tree.printChildren("Soda")
        print(tree.search("Coffee"))
        print("\n\n")
    }
    
    func testRingBuffer() {
        var ringBuffer = RingBuffer<Int>(count: 4)
        ringBuffer.write(0)
        ringBuffer.write(1)
        ringBuffer.write(2)
        ringBuffer.write(3)
        print("\n")
        print(ringBuffer)
        print("\n")
        for element in ringBuffer {
            print("element: \(element)")
        }
        print("\n")
        print(ringBuffer.read())
        print(ringBuffer.read())
        print(ringBuffer)
        print("\n")
        ringBuffer.write(4)
        ringBuffer.write(5)
        print(ringBuffer)
        print("\n")
        print(ringBuffer.read())
        print(ringBuffer.read())
        print(ringBuffer)
        print("\n")
        ringBuffer.write(6)
        ringBuffer.write(7)
        print(ringBuffer)
        print("\n")
        print(ringBuffer.read())
        print(ringBuffer.read())
        print(ringBuffer.read())
        print(ringBuffer.read())
        print(ringBuffer)
        print("\n")
    }
    
    func testBinaryTree() {
        // (5 * (a - 10)) + (-4 * (3 / b))
        // leaf nodes
        let node5 = BinaryTree.node(.empty, "5", .empty)
        let nodeA = BinaryTree.node(.empty, "a", .empty)
        let node10 = BinaryTree.node(.empty, "10", .empty)
        let node4 = BinaryTree.node(.empty, "4", .empty)
        let node3 = BinaryTree.node(.empty, "3", .empty)
        let nodeB = BinaryTree.node(.empty, "b", .empty)
        
        // nodes on the left
        let aminus10 = BinaryTree.node(nodeA, "-", node10)
        let timesLeft = BinaryTree.node(node5, "*", aminus10)
        
        // nodes on the right
        let minus4 = BinaryTree.node(.empty, "-", node4)
        let devided3andB = BinaryTree.node(node3, "/", nodeB)
        let timesRight = BinaryTree.node(minus4, "*", devided3andB)
        
        // make root
        let root = BinaryTree.node(timesLeft, "+", timesRight)
        
        print("\n\n")
        print(root)
        
        
        // ((1 + 2) / a) * (10 * b)
        let _node1 = BinaryTreeNode<String>(value: "1")
        let _node2 = BinaryTreeNode<String>(value: "2")
        let _nodeA = BinaryTreeNode<String>(value: "a")
        let _node10 = BinaryTreeNode<String>(value: "10")
        let _nodeB = BinaryTreeNode<String>(value: "b")
        
        let onePlusTwo = BinaryTreeNode<String>(value: "+", left: _node1, right: _node2)
        let devideLeft = BinaryTreeNode<String>(value: "/", left: onePlusTwo, right: _nodeA)
        
        let _timesRight = BinaryTreeNode<String>(value: "*", left: _node10, right: _nodeB)
        
        let root2 = BinaryTreeNode<String>(value: "*", left: devideLeft, right: _timesRight)
        print("\n\n")
        print(root2)
        print("\nlevelOrder")
        root2.traverseLevelOrder()
        print("\npreOrder")
        root2.traversePreOrder { (value) in
            print(value)
        }
        print("\ninOrder")
        root2.traverseInOrder{ print($0) }
        print("\npostOrder")
        root2.traversePostOrder{ print($0) }
        print("\n\n")
    }
    
    func testBST() {
        print("\n\n")
        //tree = [1, 3, 2, (5)<-root, 10, 8, 12]
        let bst = BinarySearchTree<Int>(value: 10)
        bst.insert(8); bst.insert(20); bst.insert(7); bst.insert(5); bst.insert(13)
        bst.insert(3); bst.insert(31); bst.insert(16); bst.insert(18); bst.insert(37)
        bst.insert(1); bst.insert(41)
        print("bst: \(bst.debugDescription)"); print("\n")
        print("search(8): \(bst.search(8))"); print("\n")
        print("iterateSearch(8): \(bst.iterateSearch(8))"); print("\n")
        print("min: \(bst.minimum().value)"); print("\n")
        print("max: \(bst.maximum().value)"); print("\n")
        print("preOrder")
        bst.traversePreOrder{ print("\($0)") }; print("\n")
        print("inOrder")
        bst.traverseInOrder{ print("\($0)") }; print("\n")
        print("postOrder")
        bst.traversePostOrder{ print("\($0)") }; print("\n")
        print("levelOrder")
        bst.traverseLevelOrder(); print("\n")
//        print("\n")
//        print("18.successor: \(bst.successor(of: 18))") // 20
//        print("\n")
//        print("40.successor: \(bst.successor(of: 40))") // nil
        print("\n\n")
    }
    
    func testBST2() {
        print("\n\n")
        let tree = BinarySearchTree<Int>(value: 10)
        tree.insert(5); tree.insert(12); tree.insert(3); tree.insert(7)
        tree.insert(1); tree.insert(4); tree.insert(6); tree.insert(9)
        tree.insert(14); tree.insert(15); tree.insert(16); tree.insert(21)
        XCTAssertEqual(tree.count, 13)
        XCTAssertEqual(tree.minimum().value, 1)
        XCTAssertEqual(tree.maximum().value, 21)
        XCTAssertNil(tree.search(100))
        XCTAssertEqual(tree.toArray(), [1, 3, 4, 5, 6, 7, 9, 10, 12, 14, 15, 16, 21])
        var node = tree.search(9)
//        XCTAssertEqual(node.depth, 4)
        XCTAssertEqual(node!.successor()!.value, 10)
        node = tree.search(21)
        XCTAssertEqual(node!.predecessor()!.value, 16)
        print("\n\n")
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
