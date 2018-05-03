//
//  Fibonacci.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 3. 30..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//
/*
 ### 피보나치 수열
 - n 까지의 수열 합 구하기
 - n 까지의 수열 구하기
 - recursion 은 memoization 을 사용해야 loop 정도의 시간 복잡도를 확보할 수 있다.
     - recursion 으로 구현시 대략 O(nlogn)
     - memoization 사용시 O(n), 대신 memo 할 공간이 추가로 필요하므로 공간 복잡도가 증가함 O(n)
 - 피보나치와 같은 경우는 loop 를 사용하는게 효율적이라고 생각됨
 */
//
//

import Foundation

class Fibonacci {
    
    func sumWithLoop(_ n: Int) -> Int {
        print("\(#function)")
        var first = 0, second = 1
        var sum: Int = first + second
        if n <= 1 { return sum }
        for _ in 2..<n {
            sum = first + second
            first = second
            second = sum
        }
        return sum
    }
    
    func sumWithRecursion(_ n: Int) -> Int {
        print("\(#function)")
        if n <= 1 { return n }
        let first = n - 2, second = n - 1
        return sumWithRecursion(first) + sumWithRecursion(second)
    }
    
    func sumWithMemoizationRecursion(_ n: Int, memo: inout [Int: Int]) -> Int {
        print("\(#function)")
        if n <= 1 { return n }
        if let exist = memo[n] {
            return exist
        }
        memo[n] = sumWithMemoizationRecursion(n-1, memo:&memo) + sumWithMemoizationRecursion(n-2, memo:&memo)
        return memo[n]!
    }
    
    static func numberWithLoop(_ n: Int) -> [Int] {
        print("\(#function)")
        var numbers = [0, 1]
        if n <= 1 { return numbers }
        for _ in 0..<n {
            let first = numbers.last!
            let second = numbers[numbers.count - 2]
            numbers.append(first + second)
        }
        return numbers
    }
    
    static func numberWithRecursion(_ n: Int, first: Int, second: Int) -> [Int] {
        print("\(#function)")
        let sum = first + second
        let numbers = [first, second]
        if n <= 1{ return numbers }
        return [sum] + numberWithRecursion(n-1, first: second, second: sum)
    }
    
    static func allFib(n: Int) -> [Int] {
        var all = [0, 1]
        if n == 0 { return all }
        var num1 = 0, num2 = 1
        for _ in 1..<n {
            let sum = num1 + num2
            num1 = num2
            num2 = sum
            all.append(sum)
        }
        return all
    }
}

/*
// 최적화된 피보나치 수열 구하기
static func fibonacci(n: Int) -> Int {
    if n == 0 { return 0 }
    var a = 0, b = 1
    for _ in 2..<n {
        let c = a + b
        a = b
        b = c
    }
    return a + b
}

static func allFib(_ n: Int) -> [Int] {
    var fibonaccies = [Int]()
    var memo = [Int](repeating:0, count:n)
    for i in 0..<n {
        fibonaccies.append(fib(i, memo: &memo))
    }
    return fibonaccies
}

@discardableResult
private static func fib(_ n: Int, memo: inout [Int]) -> Int {
    if n <= 0 {return 0}
    if n == 1 {return 1}
    if memo[n] > 0 {return memo[n]}
    memo[n] = fib(n-1, memo: &memo) + fib(n-2, memo: &memo)
    return memo[n]
}
*/
