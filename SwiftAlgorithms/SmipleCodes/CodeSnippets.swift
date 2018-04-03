//
//  CodeSnipets.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 3. 15..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

struct Snippets {
    // MARK: - base algorithm
    
    /// 파라미터가 소수인지 판단하는 함수. O(log n)
    ///
    /// - Parameter number: 정수
    /// - Returns: number 가 소수이면 true, 소수가 아니면 false 반환
    static func isPrime(_ number: Int) -> Bool {
        var x = 2
        let limit = Int(sqrt(Double(number)))
        print("limit: \(limit)")
        while x <= limit {
            print("x: \(x)")
            if number % x == 0 {
                return false
            }
            x += 1
        }
        return true
    }
    
    /*
    /// 주어진 문자열의 순열을 구하는 함수
    ///
    /// - Parameter str: 문자열
    static func permutation(_ str: String) {
        print("\(#function) str: \(str)")
        permutation(str, prefix: "")
    }
    
    /// 주어진 문자열의 순열을 구하는 private 함수
    ///
    /// - Parameters:
    ///   - str: 문자열
    ///   - prefix: 초기값
    // 아래 함수는 substring 시 range 를 벗어나도록 짜여져있어 assert 에 걸린다.
    private static func permutation(_ str: String, prefix: String) {
        print(" \(#function) str: \(str), prefix: \(prefix)")
        if str.count == 0 {
            print(prefix)
        } else {
            for i in 0..<str.count {
                let newStr = str.substring(from: 0, to: i) + str.substring(from: i, length: 1)
                let newPrefix = prefix + str.substring(from: i, length: 1)
                print("     new str: \(newStr), new prefix: \(newPrefix)")
                permutation(newStr, prefix: newPrefix)
            }
        }
    }
    */
    
    
    
    // 비트 값 확인
    // 1을 i 비트만큼 시프트해서 00010000 과 같은 값을 만든다. 그 다음 AND 연산을 통해 num 의 i 번째 비트를 뺀 나머지 비트를 모두 삭제한 뒤, 이 값을 0과 비교한다. 만약 이 값이 0이 아니라면 i 번째 비트는 1이어야 하고, 0 이라면 i 번째 비트는 0 이어야 한다.
    static func getBit(num: Int, i: Int) -> Bool {
        return (num & (1 << i)) != 0
    }
    
    // 비트값 채워넣기
    // 1을 i 비트만큼 시프트해서 00010000 과 같은 값을 만든다. 그 다음 OR 연산자를 통해 num 의 i 번째 비트값을 바꾼다. i 번째를 제외한 나머지 비트들은 0 과 OR 연산을 하게 되므로 num 에 아무런 영향을 끼치지 않는다.
    func setBit(num: Int, i: Int) -> Int {
        return (num | (1 << i))
    }
    
    // 비트값 삭제하기
    // setBit 함수를 거의 반대로 한 것과 같다.
    func clearBit(num: Int, i: Int) -> Int {
        let mask = ~(1 << i)
        return num & mask
    }
}


extension Int {
    /// 자신의 팩토리얼을 구하는 재귀 함수. O(n) 20 보다 큰 정수는 Int 타입의 range 때문에 overflow 가 발생한다.
    ///
    /// - Returns: 자신보다 작거나 같은 모든 양의 정수의 곱을 반환
    func factorial() -> Int {
        if self < 0 { return 0 }
        if self == 0 { return 1 }
        return self * (self - 1).factorial()
    }
    /// 파라미터의 팩토리얼을 구하는 재귀 함수. O(n)
    ///
    /// - Parameter n: 정수
    /// - Returns: 자신보다 작거나 같은 모든 양의 정수의 곱을 반환
    func anotherFatorial(_ n: Int) -> Int {
        var n = n
        var result = 1
        while n > 0 {
            result *= n
            n -= 1
        }
        return result
    }
}


