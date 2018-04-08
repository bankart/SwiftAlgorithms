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
