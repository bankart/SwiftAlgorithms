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
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFibonacci() {
        print("\n\n")
        let input = 5
        print(Fibonacci.numberWithLoop(input))
        print()
        print(Fibonacci.numberWithRecursion(input, first: 0, second: 1))
        print()
        let fib = Fibonacci()
        print(fib.sumWithLoop(input))
        print()
        var memo = [Int: Int]()
        print(fib.sumWithMemoizationRecursion(input, memo: &memo))
        
        print()
        memo = [Int: Int]()
        func numberOfFib(_ index: Int, memo: inout [Int: Int]) -> Int {
            guard index > 1 else {
                if index == 1 {                
                    memo[index] = index
                }
                return index
            }
            if memo[index] != nil { return memo[index]! }
            memo[index] = numberOfFib(index - 1, memo: &memo) + numberOfFib(index - 2, memo: &memo)
            return memo[index]!
        }
        let result = numberOfFib(5, memo: &memo)
        print("fibonacci numbers: \(memo.values.sorted())")
        print("fibonacci number of 5: \(result)")
        print("\n\n")
    }
    
    func testQuiz() {
        GoogleWorks.findPairOfSum()
        testSample1()
    }
    
    func testTimeComplexity() {
        print("\n\n")
        let arr1 = [0, 1, 2, 3, 4, 5, 6]
        let arr2 = [10, 20, 30, 40, 50, 60, 70, 80]
        print("각 원소에 접근하는 연산 시간은 개당 1회")
        print("arr1.count: \(arr1.count), O(1)")
        for i in 0..<arr1.count {
            print("\(arr1[i]) - \(i)")
        }
        print("arr2.count: \(arr2.count), O(1)")
        for i in 0..<arr2.count {
            print("\(arr2[i]) - \(i)")
        }
        print("\n")
        
        var counting: Int = 0
        print("arr1 의 원소 1개당 arr2 의 원소 전체 갯수만큼 반복")
        print("arr1.count: \(arr1.count), arr2.count: \(arr2.count), O(2n) = O(\(arr1.count)*\(arr2.count))")
        for i in 0..<arr1.count {
            for j in 0..<arr2.count {
                counting += 1
                print("\(arr1[i])_\(arr2[j]) - \(counting)")
            }
        }
        print("\n")
        print("arr1 의 원소 1개당 arr2 의 원소 전체 갯수만큼 순환하고 그 안에서 다시 1000번 더 반복하더라도 1000은 상수항이므로 무시하고 결국 O(3n) 이 된다.")
        print("3n = \(arr1.count)*\(arr2.count)*\(1000) = \(arr1.count * arr2.count * 1000)")
        for i in 0..<arr1.count {
            for j in 0..<arr2.count {
                for k in 0..<1000{
                    counting += 1
                }
            }
        }
        print("counting: \(counting)")
        print("\n")
        
        
        counting = 0
        print("동일 배열을 이중 loop 로 접근시 O(n^2)")
        print("arr1.count: \(arr1.count), O(\(arr1.count)^\(arr1.count))")
        for i in 0..<arr1.count {
            for j in 0..<arr1.count {
                counting += 1
                print("\(arr1[i]) + \(arr1[j]) = \(arr1[i] + arr1[j]) - \(counting)")
            }
        }
        print("\n")
        
        counting = 0
        print("n(n-1)/2 => O(n^2)")
        print("j 가 i 보다 큰 모든 (i, j) 쌍을 반복. 결과를 보면 (n^2)/2 의 행렬로 보인다.")
        for i in 0..<arr1.count {
            for j in stride(from: i+1, to: arr1.count, by: 1) {
                counting += 1
                print("\(arr1[i]) + \(arr1[j]) = \(arr1[i] + arr1[j]) - \(counting)")
            }
        }
        print("\n")
        
        counting = 1
        func foo(n: Int) -> Int {
            counting += 1
            if n <= 1 { return 1 }
            return foo(n: n-1) + foo(n: n-1)
        }
        let initValue = 4
        print(foo(n: initValue))
        print("func foo(:)'s time complexity: O(2^n) = O(2^\(initValue)) = \(counting)")
        
        print("\n\n")
    }
    
    func testTimeComplexity2() {
        var strArray = ["abc", "ab", "abcde", "a"]
        print("strArray: \(strArray)")
        print(strArray.sorted { (str0, str1) -> Bool in
            str0.count < str1.count
        })
        
        func sortForLength(arr: inout [String]) {
            for x in 1..<arr.count {
                var y = x
                print("x: \(x)")
                while y > 0 && arr[y].count > arr[y - 1].count {
                    print("y: \(y), arr[\(y)](\(arr[y].count)) > arr[y-1](\(arr[y-1].count))")
                    arr.swapAt(y - 1, y)
                    y -= 1
                }
            }
        }
        sortForLength(arr: &strArray)
        print("after sorting for length > strArray: \(strArray)")
    }
    
    func testSorting() {
        print("\n\n")
        // let input = [10, 7, 3, 12, 9, 5, 1]
        let input = SampleData.getIntList(true)!.filter{ $0 % 100 == 0 }//[1, 7, 3, 8, 12, 9, 5, 14]
        let sort = InsertionSort()
        print("input.count: \(input.count)")
        print()
        let startTime0 = Date.timeIntervalSinceReferenceDate
        var _ = sort.execute(input, comparison: >)
        let endTime0 = Date.timeIntervalSinceReferenceDate
        print("insertion sort \(endTime0 - startTime0)s")
//        print()
//        output = sort.execute(input, comparison: <)
//        print("output: \(output)")
        print("\n\n")
    }
    
    func testSorting2() {
        print("\n\n")
        let input = SampleData.getIntList(true)!.filter{ $0 % 250 == 0 }//[31, 8, 48, 73, 11, 3, 20, 29, 65, 15]
        print("input.count: \(input.count)")
        let sort = BubbleSort()
        let startTime0 = Date.timeIntervalSinceReferenceDate
        var _ = sort.execute(input, comparison: >)
        let endTime0 = Date.timeIntervalSinceReferenceDate
        print("bubble sort \(endTime0 - startTime0)s")
//        print()
//        output = sort.execute(input, comparison: <)
//        print("output: \(output)")
        print("\n\n")
    }
    
    func testSorting3() {
        print("\n\n")
        let input = SampleData.getIntList(true)!//[31, 8, 48, 73, 11, 3, 20, 29, 65, 15]
        print("input.count: \(input.count)")
        print()
        let sort = MergeSort()
        let startTime0 = Date.timeIntervalSinceReferenceDate
        let _ = sort.execute(input)
        let endTime0 = Date.timeIntervalSinceReferenceDate
        print("merge sort \(endTime0 - startTime0)s")
        print("\n\n")
    }
    
    func testSorting4() {
        print("\n\n")
//        var input = [31, 8, 48, 73, 11, 3, 20, 29, 65, 15]
        var input = SampleData.getIntList(true)!// [31, 8]
        print("input.count: \(input.count)")
        let sort = QuickSort()
        
        let startTime0 = Date.timeIntervalSinceReferenceDate
        let _ = sort.execute(input)
        let endTime0 = Date.timeIntervalSinceReferenceDate
        print("use high-ordered function and recursion, quick sort \(endTime0 - startTime0)s")
        print()
        
        let startTime1 = Date.timeIntervalSinceReferenceDate
        sort.execute2(&input)
        let endTime1 = Date.timeIntervalSinceReferenceDate
        print("use inout property, partition method and recursion, quick sort \(endTime1 - startTime1)s")
        
        print("\n\n")
    }
    
    func testSorting5() {
        print("\n\n")
        var results = [(Double, Double, Double)]()
        for i in 0..<10 {
            let result = BinarySearch.execute()
            print("test \(i): \r\tbinarySearchRecursively - \(result.0), binarySearchLoop - \(result.1), linear: \(result.2)")
            results.append(result)
        }
        var binarySearchRecursively: Double = 0, binarySearchLoop: Double = 0, linear: Double = 0
        for result in results {
            binarySearchRecursively += result.0
            binarySearchLoop += result.1
            linear += result.2
        }
        print("sum of binarySearchRecursively \(results.count) times = \(binarySearchRecursively / Double(results.count))")
        print("sum of binarySearchLoop \(results.count) times = \(binarySearchLoop / Double(results.count))")
        print("sum of linear \(results.count) times = \(linear / Double(results.count))")
        print("\n\n")
    }
    
    func testHash() {
        print("\n\n")
        let input = [10, 7, 3, 12, 9, 5, 1]
        let hashList = HashList(list: input)
        hashList.printSelf()
        for el in input {
            print("\(el) is stored on hashList's \(hashList.search(el))")
        }
        print("\n\n")
    }
    
    func testSnippets() {
        print("\n\n")
        let number = 7
        if Snippets.isPrime(number) {
            print("\(number) is prime")
        } else {
            print("\(number) is not a prime")
        }
        var num = 20
        print("\(num).factorial() = \(num.factorial())")
        num = 21
        print("\(num).factorial() = \(num.anotherFatorial(21))")
//        print("\n")
//        Snippets.permutation("string")
//        print("\n")
//        print(Snippets.allFib(10))
//        print("\n")
//        print("root(4) = \(sqrt(4))")
        print("\n\n")
    }
    
//    func testProtocol() {
//        print("\n\n")
//        makeSome()
//        print("\n")
//        makeGenericProtocol()
//        print("\n")
//        testMonad()
//        print("\n\n")
//    }
    
    func testPalindromes() {
        print("\n\n")
        let str = "ra?ce*Car"
        print("\(str) is palindrome? \(str.isPalindrome())")
        print()
        let str2 = "akazcka"
        print("\(str2) is palindrome? \(str2.isPalindrome())")
//        Palindromes.isPalindrome(str)
        
        func checkPalindrome(_ str: String) -> Bool {
            let str = str.replacingOccurrences(of: "\\W", with: "", options: String.CompareOptions.regularExpression, range: nil).lowercased()
            var left = 0, right = str.length - 1
            let chars = Array(str)
            print(chars)
            while left < right {
                if chars[left] == chars[right] {
                    left += 1
                    right -= 1
                } else {
                    return false
                }
            }
            return true
        }
        print("\(str) is palindrome? \(checkPalindrome(str))")
        print("\(str2) is palindrome? \(checkPalindrome(str2))")
        
        print("\n\n")
    }
    
    func testPermutation() {
        var util = Permutations()
        let arr = ["a", "b", "c"]
        util.permuteWirth(arr, arr.count - 1)
    }
    
    func testHeap() {
        print("\n\n")
        let nodes = [2, 8, 6, 1, 10, 15, 3, 12, 11]
        print("original: \(nodes)\n")
        
//        let heap = Heap<Int>(array: nodes, sort:<)
//        print("heap.nodes: \(heap.nodes)")
//
//        var heap2 = Heap2<Int>(array:nodes, comparator:<)
//        print("heap2.elements: \(heap2.elements)")
        
        
        var _nodes = nodes
        func heapify(from index: Int, until endIndex: Int) {
            
            let leftChildIndex = (index * 2) + 1
            let rightChildIndex = leftChildIndex + 1
            var first = index
            
            if leftChildIndex < endIndex && _nodes[leftChildIndex] < _nodes[index] {
                first = leftChildIndex
            }
            if rightChildIndex < endIndex && _nodes[rightChildIndex] < _nodes[index] {
                if _nodes[rightChildIndex] < _nodes[leftChildIndex] {
                    first = rightChildIndex
                }
            }
            
            if first == index {
                print("     finished heapify for nodes[\(index)] = \(_nodes[index])")
                print("     result: \(_nodes)\n")
                return
            }
            // 자식이랑 자신의 위치를 바꿈
            _nodes.swapAt(first, index)
            print("  > swap(\(first){\(_nodes[first])}, \(index){\(_nodes[index])}")
            heapify(from: first, until: endIndex)
        }
        
        print("\nstart heapify\n")
        for i in stride(from: (nodes.count/2)-1, through: 0, by: -1) {
            print("call heapify: \(i)")
            heapify(from: i, until: _nodes.count)
        }
        print()
        print("max heap: \(_nodes)")
        print("\n\n")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
