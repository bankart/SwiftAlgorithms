//
//  HackerRank.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 10..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

struct FirstExperience {
    /// 주어진 배열의 원소중 k 값을 찾아라. 있으면 YES, 없으면 NO 를 반환하라
    func findNumber(arr: [Int], k: Int) -> String {
        var result = "NO"
        var left = 0, right = arr.count - 1
        while left < right {
            if arr[left] == k || arr[right] == k {
                result = "YES"
            }
            if arr[left] != k {
                left += 1
            }
            if arr[right] != k {
                right -= 1
            }
        }
        return result
    }
//    let result = findNumber(arr: [2, 3, 1], k: 5)
//    print(result)
    
    /// 주어진 l, r 을 포함하는 두 수 사이의 정수중 홀수인 경우만 출력하라
    func oddNumbers(l: Int, r: Int) -> [Int] {
        var odds = [Int]()
        for number in l...r {
            if number % 2 != 0 {
                odds.append(number)
            }
        }
        return odds
    }
//    let odds = oddNumbers(l: 2, r: 9)
//    print("odd numbers: \(odds)")
    
}


struct WarmingUp {
    
//    let arr = [[11, 2, 4], [4, 5, 6], [10, 8, -12]]
    /// 주어진 배열의 원소를 X 형태의 사선으로 접근하여 각 대각선에 위치한 원소들의 값을 더하는 문제
    func diagonalDifference(a: [[Int]]) -> Int {
        /*
         * Write your code here.
         */
        
        var sumOfDigonal0 = 0, sumOfDigonal1 = 0
        var left = 0, right = a.count - 1
        while (left < a.count && right >= 0) {
            sumOfDigonal0 += a[left][right]
            print("\(sumOfDigonal0) += arr[\(left)][\(right)] = \(a[left][right])")
            sumOfDigonal1 += a[right % a.count][right]
            print("\(sumOfDigonal1) += arr[\(right % a.count)][\(right)] = \(a[right % a.count][right])\n")
            left += 1
            right -= 1
        }
        print(sumOfDigonal0, sumOfDigonal1)
        return abs(sumOfDigonal0 - sumOfDigonal1)
    }
//    print(diagonalDifference(a: arr))
    
    
    // 주어진 배열에 존재하는 양수, 음수, 0 의 출현 비율을 출력하는 문제
    func plusMinus(arr: [Int]) -> Void {
        enum Key: UInt8 {
            case positive = 0, negative, zero
        }
        
        var comp = [Key.positive: 0.0, .negative: 0.0, .zero: 0.0]
        for number in arr {
            if number > 0 {
                comp[.positive]! += 1
            } else if number < 0 {
                comp[.negative]! += 1
            } else {
                comp[.zero]! += 1
            }
        }
        let total = Double(arr.count)
        let sortedKeys = comp.keys.sorted { (key0, key1) -> Bool in
            key0.rawValue < key1.rawValue
        }
        for key in sortedKeys {
            print(comp[key]! / total)
        }
    }
//    plusMinus(arr: [-4, 3, -9, 0, 4, 1])
    
    
    /// # 찍기
    func staircase(n: Int) -> Void {
        for row in 0..<n {
            var asterisks = ""
            for col in 1...n {
                if col / (n - row) == 0 {
                    asterisks += " "
                } else {
                    asterisks += "#"
                }
            }
            print(asterisks)
        }
        
    }
//    print("=====================")
//    staircase(n: 6)
}
