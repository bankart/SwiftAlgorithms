//
//  Quiz5.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 4..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

func testSample5() {
    print("\(#function)")
    /*
     [self]
     정수 배열과 타겟 숫자가 주어지면, 합이 타겟값이 되는 두 원소의 인덱스를 찾으시오.
     단, 시간복잡도 O(n) 여야 합니다.
     
     예제)
     Input: [2, 5, 6, 1, 10], 타겟 8
     Output: [0, 2] // 배열[0] + 배열[2] = 8
     
     // https://mailprogramming.com/solution/5?email=bankart0218@gmail.com&token=050b078aa5458911a8906e8bb1bcedf830bb7a040e4f3be8663910d48b2e477e
     */
    
    let input = [2, 5, 6, 1, 10]
    let target = 8
    
    func findSumOfPairs(_ list: [Int], target: Int) -> [Int] {
        guard list.count > 0 else { return list }
        var comp = [Int]()
        for i in 0..<list.count {
            let value = list[i]
            let calculated = target - value
            if comp.contains(calculated) {
                let firstElementIndex = comp.index(where: { $0 == calculated })!
                return [comp[firstElementIndex], value]
            }
            comp.append(value)
        }
        return [-1, -1]
    }
    let output = findSumOfPairs(input, target: target)
    print(output)
    
    
    func findSumOfPairsIndex(_ list: [Int], target: Int) -> [Int] {
        guard list.count > 0 else { return list }
        var result = [Int: Int]()
        
        for i in 0..<list.count {
            let complement = target - list[i]
            if result.keys.contains(complement) {
                return [result[complement]!, i]
            }
            result[list[i]] = i
            print(result)
        }
        
        return [-1, -1]
    }
    let output1 = findSumOfPairsIndex(input, target: target)
    print(output1)
    
    func findSumOfKeyValues(_ list: [Int], target: Int) -> [Int: Int]? {
        guard list.count > 0 else { return nil }
        var comp = [Int: Int]()
        for i in 0..<list.count {
            let value = list[i]
            let calculated = target - value
            if comp.keys.contains(calculated) {
                return [comp[calculated]!: calculated, i: list[i]]
            }
            comp[value] = i
        }
        return nil
    }
    let output2 = findSumOfKeyValues(input, target: target)
    print(output2!)
    
    
//    // 아래 함수는 O(n^2) 이므로 탈락
//    func findSumOfPairs(_ list: [Int], target: Int) -> ([Int], Int) {
//        guard list.count > 0 else { return (list, -1) }
//        var result = [Int]()
//        var cursor = 0
//
//        while cursor < list.count {
//            for i in stride(from: cursor+1, to: list.count, by: 1) {
//                if list[cursor] + list[i] == target {
//                    result.append(cursor)
//                    result.append(i)
//                }
//            }
//            cursor += 1
//        }
//
//        var sum = 0
//        for index in result {
//            sum += list[index]
//        }
//
//        return (result, sum)
//    }
    
    
}

