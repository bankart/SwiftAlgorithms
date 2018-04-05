//
//  Quiz2.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 4..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

func testSample2() {
    /*
     피보나치 배열은 0과 1로 시작하며, 다음 피보나치 수는 바로 앞의 두 피보나치 수의 합이 된다. 정수 N이 주어지면, N보다 작은 모든 짝수 피보나치 수의 합을 구하여라.
     예제)
     Input: N = 12
     Output: 10 // 0, 1, 2, 3, 5, 8 중 짝수인 2 + 8 = 10.
     */
    
    var input = 12
    var calling = 0
    
    // use loop
    @discardableResult
    func fib(_ n: Int) -> Int {
        if n <= 0 { return 0 }
        var a = 0, b = 1
        var evenSum: Int = 0
        for _ in 2..<n {
            let c = a + b
            calling += 1
            print("\(#function) calling: \(calling)")
            if c % 2 == 0 && c < n {
                evenSum += c
            }
            if c > n {
                break
            }
            a = b
            b = c
        }
        print("sum: \(a + b)")
        print("\(#function) evenSum: \(evenSum)")
        return a + b
    }
    fib(input)
    
    var memo = [Int: Int]()
    var result = 0
    calling = 0
    // use recursion
    @discardableResult
    func fib2(_ n: Int, memo: inout [Int: Int], target: Int, result: inout Int) -> Int {
        calling += 1
        print("\(#function) calling: \(calling)")
        if n == 0 || n == 1 {
            return n
        }
        if memo[n] != nil {
            return memo[n]!
        }
        let sum = fib2(n-1, memo: &memo, target: target, result: &result) + fib2(n-2, memo: &memo, target: target, result: &result)
        if sum % 2 == 0 && sum < target {
            result += sum
        }
        
        memo[n] = sum
        return sum
    }
    fib2(input, memo: &memo, target: input, result: &result)
    print("fib2: \(result)")
    
    
    calling = 0
    func fib3(_ n: Int) -> [Int] {
        var fibs = [0, 1]
        for index in 2..<n {
            let first = fibs[index - 2]
            let second = fibs[index - 1]
            fibs.append(first + second)
            calling += 1
            print("\(#function) calling: \(calling)")
        }
        return fibs
    }
    print("fib3: \(fib3(input))")
    
    func fib4(_ n: Int, first: Int, second: Int) -> [Int] {
        let result = [first + second]
        if n <= 1 { return result }
        print(first, second)
        return result + fib4(n-1, first: second, second: first + second)
    }
    print("fib4: \([0, 1] + fib4(5, first: 0, second: 1))")
}
