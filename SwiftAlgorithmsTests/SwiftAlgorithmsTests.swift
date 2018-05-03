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
        print("optimization fib: \(Fibonacci.allFib(n: input))")
        
        var memo = [Int:Int]()
        @discardableResult
        func allFib(n: Int, memo: inout [Int:Int]) -> Int {
            if n <= 1 {
                memo[n] = n
                return n
            }
            if memo[n] != nil { return memo[n]! }
            memo[n] = allFib(n: n-1, memo: &memo) + allFib(n: n-2, memo: &memo)
            return memo[n]!
        }
        allFib(n: 5, memo: &memo)
        var fibs = [Int]()
        memo.keys.sorted().forEach {
            fibs.append(memo[$0]!)
        }
        print("memoization fib: \(fibs)")
//        print(Fibonacci.numberWithLoop(input))
//        print()
//        print(Fibonacci.numberWithRecursion(input, first: 0, second: 1))
//        print()
//        let fib = Fibonacci()
//        print(fib.sumWithLoop(input))
//        print()
//        var memo = [Int: Int]()
//        print(fib.sumWithMemoizationRecursion(input, memo: &memo))
//
//        print()
//        memo = [Int: Int]()
//        func numberOfFib(_ index: Int, memo: inout [Int: Int]) -> Int {
//            guard index > 1 else {
//                if index == 1 {
//                    memo[index] = index
//                }
//                return index
//            }
//            if memo[index] != nil { return memo[index]! }
//            memo[index] = numberOfFib(index - 1, memo: &memo) + numberOfFib(index - 2, memo: &memo)
//            return memo[index]!
//        }
//        let result = numberOfFib(5, memo: &memo)
//        print("fibonacci numbers: \(memo.values.sorted())")
//        print("fibonacci number of 5: \(result)")
        print("\n\n")
    }
    
    func testQuiz() {
        print("\n\n")
        
        let hackerrankWarmup = WarmingUp()
        
        print("left rotation: \(hackerrankWarmup.leftRotation(input: [1, 2, 3, 4, 5], perform: 4))")
        
//        var inputString = """
//        1 1 1 0 0 0
//        0 1 0 0 0 0
//        1 1 1 0 0 0
//        0 0 2 4 4 0
//        0 0 0 2 0 0
//        0 0 1 2 4 0
//        """
//
//        inputString = """
//        1 1 1 0 0 0
//        0 1 0 0 0 0
//        1 1 1 0 0 0
//        0 9 2 -4 -4 0
//        0 0 0 -2 0 0
//        0 0 -1 -2 -4 0
//        """
//
//        inputString = """
//        1 1 1 0 0 0
//        0 1 0 0 0 0
//        1 1 1 0 0 0
//        0 0 2 4 4 0
//        0 0 0 2 0 0
//        0 0 1 2 4 0
//        """
//
//        // -6
//        inputString = """
//        -1 -1 0 -9 -2 -2
//        -2 -1 -6 -8 -2 -5
//        -1 -1 -1 -2 -3 -4
//        -1 -9 -2 -4 -4 -5
//        -7 -3 -3 -2 -9 -9
//        -1 -3 -1 -2
//        """
//
//        let sliced = inputString.components(separatedBy: "\n")
//        var input = [[Int]]()
//        sliced.forEach {
//            input.append($0.components(separatedBy: " ").compactMap { Int($0) })
//        }
//        print(input)
//        let output = hackerrankWarmup.array2D(arr: input)
//        print("output: \(output)")
        
        
//        print(hackerrankWarmup.reverseArray(a: [1, 4, 3, 2]))
        
//        hackerrankWarmup.utopianTree([0, 1, 4])
//        hackerrankWarmup.utopianTree([0, 1])
//        hackerrankWarmup.utopianTree([4, 3])
        
//        var input = [1, 4, 4, 4, 5, 3]
//        input = [1, 4, 4, 4, 5, 3, 3, 3]
//        let result = hackerrankWarmup.migratoryBirds(n: input.count, ar: input)
        
//        hackerrankWarmup.divisibleSumPairs(length: 6, divider: 3, input: [1, 3, 2, 6, 1, 2])
        
//        hackerrankWarmup.chocoBarCounts(length: 5, chocoBars: [1, 2, 1, 3, 2], birthDayInfos: [3, 2])
//        hackerrankWarmup.chocoBarCounts(length: 6, chocoBars: [1, 1, 1, 1, 1, 1], birthDayInfos: [3, 2])
//        hackerrankWarmup.chocoBarCounts(length: 1, chocoBars: [4], birthDayInfos: [4, 1])
//        hackerrankWarmup.chocoBarCounts(length: 19, chocoBars: [2, 5, 1, 3, 4, 4, 3, 5, 1, 1, 2, 1, 4, 1, 3, 3, 4, 2, 1], birthDayInfos: [18, 7])
        
        
//        hackerrankWarmup.getTotalX(a: [2, 4], b: [16, 32, 96])
        
//        var input = [10, 5, 20, 20, 4, 5, 2, 25, 1]
//        var result = hackerrankWarmup.breakingRecords(score: input)
//        print(result)
//
//        input = [3, 4, 21, 36, 10, 28, 35, 5, 24, 42]
//        result = hackerrankWarmup.breakingRecords(score: input)
//        print(result)
//
//        let inputString = "44316 52125 68761 68787 39275 96092 3320 80485 33978 55037 55142 47170 26255 59084 50342 38609 1015 10553 5292 94856 88112 50516 57426 51488 86656 69595 71558 34143 90351 6500 82497 34667 58626 67611 3454 14253 80055 23126 94738 30386 94516 66232 77556 20771 25316 44251 59380 42683 54804 81024 53891 42916 31540 11318 10757 34549 80913 98667 68692 87616 21519 67542 38635 80145 35153 58441 10750 31560 81568 21840 61946 92436 88072 55855 13207 29741 106 88939 88776 71262 86315 42668 30531 17856 53986 57640 52405 51251 56307 37449 38868 77826 21343 77503 74324 72848 52297 85074 4409 33865 6915 66355 26301 11339 22210 55860 57432 38668 61151 46209 9931 63818 88877 56814 81674 42863 14454 50431 10466 70761 4233 49334"
//        input = inputString.components(separatedBy: " ").compactMap { Int($0) }
//        result = hackerrankWarmup.breakingRecords(score: input)
//        print(result)
        
//        hackerrankWarmup.countApplesAndOranges(s: 7, t: 11, a: 5, b: 15, apples: [-2, 2, 1], oranges: [5, -6])
//        hackerrankWarmup.countApplesAndOranges(s: 2, t: 3, a: 1, b: 5, apples: [2], oranges: [-2])
        
        
//        let result = hackerrankWarmup.gradingStudents(grades: [73, 67, 38, 33])
//        print(result)
        
        
//        var time = "12:40:22AM"
//        var result = hackerrankWarmup.timeConversion(s: time)
//        print("result: \(result)\n")
//        time = "07:05:45PM"
//        result = hackerrankWarmup.timeConversion(s: time)
//        print("result: \(result)")
//        time = "12:40:22PM"
//        result = hackerrankWarmup.timeConversion(s: time)
//        print("result: \(result)")
//
//        let input = [1, 6, 3, 5, 2]
//        let count = hackerrankWarmup.checkPortionCount(n: input.count, k: 4, hurdles: input)
//        print("portion count: \(count)")
        
        
//        let input = "1 3 1 3 1 4 1 3 2 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 7"
//        let charSizes = Array(input).split(separator: " ").compactMap { Int(String($0)) }
//        let alphabets = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
//        let sizeMap = zip(alphabets, charSizes)
//        print(sizeMap)
//        let words = ["z", "a", "b", "a"]
//        var maxSize = 0
//        for (word, size) in sizeMap {
//            for char in words {
//                print(word, size)
//                if word == char {
//                    maxSize = max(maxSize, size)
//                    break
//                }
//            }
//        }
//        print(words.count * 1 * maxSize)
        
        
//        GoogleWorks.findPairOfSum()
//        print()
//        testSample1()
//        print()
//        testSample2()
//        print()
//        testSample3()
//        print()
//        testSample4()
//        print()
//        testSample5()
//        print()
//        testSample6()
//        print()
//        KakaoFirst.secretMap()

        print("\n\n")
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
        print("arr1.count: \(arr1.count), arr2.count: \(arr2.count), O(n*m) = O(\(arr1.count)*\(arr2.count))")
        for i in 0..<arr1.count {
            for j in 0..<arr2.count {
                counting += 1
                print("\(arr1[i])_\(arr2[j]) - \(counting)")
            }
        }
        print("\n")
        print("arr1 의 원소 1개당 arr2 의 원소 전체 갯수만큼 순환하고 그 안에서 다시 1000번 더 반복하더라도 1000은 상수항이므로 무시하고 결국 O(n*m*1000) 가 된다.")
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
        print(#function)
        let util = Permutations()
        let arr = ["a", "b", "c"]
        util.permutation(list: arr, n: 0)
        print()
        util.permutation(list: [1, 2, 3], n: 0)
        print()
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
    
    func testKakao() {
        print(#function)
        let quiz = WarmingUp()
//        var result = quiz.findSimilar(a: 1234, b: 2341)
//        print("success: \(result)")
//        print()
//        result = quiz.findSimilar(a: 1234, b: 1213)
//        print("fail: \(result)")
//        print()
//        result = quiz.findSimilar(a: 14567, b: 45617)
//        print("success: \(result)")
        
        let input = "giggabaj"
        let output = quiz.similarStrings(n: input.count, s: input, queries: [[1, 1], [1, 2], [1, 3], [2, 4]])
        print(output)
        print()
        let permutations = quiz.permute(input: ["a", "b", "c"], n: 0)
        print(permutations)
        print()
    }
    
    func testSort() {
        print(#function)
        
        func quickSort(arr: [Int]) -> [Int] {
            var arr = arr
            func sort(arr: inout [Int], low: Int, high: Int) {
                if low < high {
                    let pivot = partition(arr: &arr, low: low, high: high)
                    sort(arr: &arr, low: low, high: pivot - 1)
                    sort(arr: &arr, low: pivot + 1, high: high)
                }
            }
            
            func partition(arr: inout  [Int], low: Int, high: Int) -> Int {
                let pivot = arr[high]
                var j = low
                for i in low..<high {
                    if arr[i] < pivot {
                        arr.swapAt(i, j)
                        j += 1
                    }
                }
                arr.swapAt(j, high)
                return j
            }
            
            sort(arr: &arr, low: 0, high: arr.count - 1)
            return arr
        }
        
        let quickInput = [8, 1, 3, 9, 11, 4]
        print("quickInput: \(quickInput)")
        let quickOutput = quickSort(arr: quickInput)
        print("quickSort result: \(quickOutput)")
        print()
        
        func mergeSort(arr: [Int]) -> [Int] {
            var arr = arr
            func sort(arr:[Int]) -> [Int] {
                guard arr.count > 1 else { return arr }
                let middle = arr.count / 2
                let left = sort(arr: Array(arr[..<middle]))
                let right = sort(arr: Array(arr[middle...]))
                return merge(leftPile: left, rightPile: right)
            }
            
            func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
                var left = 0, right = 0
                var merged = [Int]()
                while left < leftPile.count && right < rightPile.count {
                    if leftPile[left] < rightPile[right] {
                        merged.append(leftPile[left])
                        left += 1
                    } else if rightPile[right] < leftPile[left] {
                        merged.append(rightPile[right])
                        right += 1
                    } else {
                        merged.append(leftPile[left])
                        left += 1
                        merged.append(rightPile[right])
                        right += 1
                    }
                }
                
                while left < leftPile.count {
                    merged.append(leftPile[left])
                    left += 1
                }
                
                while right < rightPile.count {
                    merged.append(rightPile[right])
                    right += 1
                }
                
                return merged
            }
            
            return sort(arr: arr)
        }
        
        let mergeInput = quickInput
        print("mergeInput: \(mergeInput)")
        let mergeOutput = quickSort(arr: mergeInput)
        print("mergeSort result: \(mergeOutput)")
        
        print()
    }
    
    
    /*
     bottle[i] 의 용량은 capacity[i] 이다.
     bottle[fromId[i]] 에서 bottle[toId[i]] 로 주스를 옮긴다.
     bottle[fromId[i]] 가 0 이 되거나, bottle[toId[i]] 이 용량이 가득 차면 다음 i + 1 번째로 넘어간다.
     */
    func testKiwiFruitsJuice() {
        
        let capacities = [[10, 10], [30, 20, 10], [14, 35, 86, 58, 25, 62]]
        let bottles = [[5, 8], [10, 5, 5], [6, 34, 27, 38, 9, 60]]
        let fromIds = [[0], [0, 1, 2], [1, 2, 4, 5, 3, 3, 1, 0]]
        let toIds = [[1], [1, 2, 0], [0, 1, 2, 4, 2, 5, 3, 1]]
        
        var index = 0
        while index < capacities.count - 1 {
            let capa = capacities[index]
            let bottle = bottles[index]
            let fromId = fromIds[index]
            let toId = toIds[index]
        }
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
