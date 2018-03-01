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
        print("\n")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
