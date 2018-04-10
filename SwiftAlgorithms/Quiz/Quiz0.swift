//
//  Quiz0.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 8..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

struct GoogleWorks {
    // video link: https://youtu.be/XKu_SEDAykw
    static func findPairOfSum() {
        /*
         input: [1, 2, 3, 9], 8
         output: false
         
         input: [1, 2, 4, 4], 8
         outpu: true
         */
        
        func hasPairWithSum<T: BinaryInteger>(_ list: [T], sum: T) -> Bool {
            var cursor: Int = 0
            while cursor < list.count {
                print("\(list[cursor]) + \(list.last!) == \(sum)")
                if list[cursor] + list.last! == sum {
                    return true
                }
                cursor += 1
            }
            return false
        }
        
        // 정렬되어 있다는 가정하에..
        let result = hasPairWithSum([1, 2, 4, 4], sum: 8)
        print(result)
        
        func hasPairWithSum2<T: BinaryInteger>(_ list: [T], sum: T) -> Bool {
            var complements = Set<T>()
            for value in list {
                print("\(complements)")
                if complements.contains(value) {
                    return true
                }
                complements.insert(sum - value)
            }
            return false
        }
        
        // 정렬되어 있지 않다는 가정하에..
        let result2 = hasPairWithSum2([3, 1, 4, 4], sum: 8)
        print(result2)
    }
}


struct KakaoFirst {
    /// 비트연산
    static func secretMap() {
        print("\(#function)")
        
        let firstMap = [[0, 1, 0, 0, 1], [1, 0, 1, 0, 0], [1, 1, 1, 0, 0], [1, 0, 0, 1, 0], [0, 1, 0, 1, 1]]
        let secondMap = [[1, 1, 1, 1, 0], [0, 0, 0, 0, 1], [1, 0, 1, 0, 1], [1, 0, 0, 0, 1], [1, 1, 1, 0, 0]]
        let result = [[1, 1, 1, 1, 1], [1, 0, 1, 0, 1], [1, 1, 1, 0, 1], [1, 0, 0, 1, 1], [1, 1, 1, 1, 1]]
        
        print("first: \(firstMap)")
        print("second: \(secondMap)")
        print("result: \(result)")
        // firstMap 과 secondMap 을 겹치면 result 와 같은 지도가 만들어지므로
        // OR 연산 필요
        // NOT: 1 은 0, 0 은 1로 반환 후 1을 더함.
        // AND: 두 자리가 모두 1인 경우에만 1을 반환
        // OR: 두 자리가 모두 0인 경우에만 0을 반환
        // XOR: 두 자리중 하나라도 1인 경우 1을 반환
        
        func bitwiseOperation(_ first: [[Int]], second: [[Int]]) -> [[Int]]? {
            guard first.count == second.count else { return nil }
            var result = Array(repeating: [Int](), count: first.count)
            for i in 0..<first.count {
                let gridOfFirstMap = first[i]
                let gridOfSecondMap = second[i]
                print("gridOfFistMap: \(gridOfFirstMap)")
                print("gridOfSecondMap: \(gridOfSecondMap)")
                if gridOfFirstMap.count != gridOfSecondMap.count {
                    return nil
                }
                
                for j in 0..<gridOfFirstMap.count {
                    result[i].append(gridOfFirstMap[j] | gridOfSecondMap[j])
                }
            }
            return result
        }
        let output = bitwiseOperation(firstMap, second: secondMap)
        print("output: \(output!)")
        
        func solve(_ arr1: [Int], _ arr2: [Int], rows: Int) -> [String] {
            let list1 = arr1.map { $0.binaryNumberList(rows) }
            let list2 = arr2.map { $0.binaryNumberList(rows) }
            
            let converted = bitwiseOperation(list1, second: list2)
            let result = converted.map { (rows) -> [String] in
                var result = [String]()
                for col in rows {
                    let colums = col.map{ $0.getWallString() }
                    let str = colums.reduce(""){ $0 + $1 }
                    result.append(str)
                }
                return result
            }
            return result ?? [String]()
        }
        print("============================")
        var output2 = solve([9, 20, 28, 18, 11], [30, 1, 21, 17, 28], rows: 5)
        print("sample: \(output2)")
        print("============================")
        output2 = solve([46, 33, 33, 22, 31, 50], [27, 56, 19, 14, 14, 10], rows: 6)
        print("solved: \(output2)")
    }
}


extension Int {
    func binaryNumberList(_ digitCount: Int) -> [Int] {
        var decimal = self
        print("\(#function) \(decimal)")
        var list = [Int]()
        while decimal > 1 {
            list.append(decimal % 2)
            decimal = Int(decimal / 2)
        }
        list.append(decimal)
        
        if list.count < digitCount {
            for _ in 0..<(digitCount - list.count) {
                list.append(0)
            }
        }
        
        list = list.reversed()
        return list
    }
    
    func getWallString() -> String {
        return (self == 0) ? " " : "#"
    }
}
