//
//  BinarySearch.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 8..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

struct BinarySearch {
    
    static func execute() -> (Double, Double, Double) {
        
        func getAvailableTarget(_ list: [Int]) -> Int {
            let target = Int(arc4random_uniform(UInt32(list.count)))
//            print("target: \(target), contains: \(list.contains(target))")
            if list.contains(target) {
                return target
            } else {
                return getAvailableTarget(list)
            }
        }
        
        let numbers = SampleData.getIntList(true)!.sorted()// [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23].sorted()//
        let target = getAvailableTarget(numbers)
        print("search target: \(target)")
        let start0 = Date.timeIntervalSinceReferenceDate
        binarySearch1(numbers, target: target, range: 0..<numbers.count)
        let end0 = Date.timeIntervalSinceReferenceDate
        let bSearchRecursively = end0 - start0
        
        let start1 = Date.timeIntervalSinceReferenceDate
        binarySearch2(numbers, target: target)
        let end1 = Date.timeIntervalSinceReferenceDate
        let bSearchLoop = end1 - start1
        
        let start2 = Date.timeIntervalSinceReferenceDate
        linearSearch(numbers, target: target)
        let end2 = Date.timeIntervalSinceReferenceDate
        let linear = end2 - start2
        
        return (bSearchRecursively, bSearchLoop, linear)
    }
    
    // recursive
    @discardableResult
    static private func binarySearch1<T: Comparable>(_ list: [T], target: T, range: Range<Int>) -> Int? {
        guard range.lowerBound < range.upperBound else { return nil }
        let mid = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        if list[mid] < target {
            return binarySearch1(list, target: target, range: mid+1..<range.upperBound)
        } else if list[mid] > target {
            return binarySearch1(list, target: target, range: range.lowerBound..<mid)
        } else {
            return mid
        }
    }
    
    // loop
    @discardableResult
    static private func binarySearch2<T: Comparable>(_ list: [T], target: T) -> Int? {
        var lower = 0
        var upper = list.count - 1
        while lower < upper {
            let mid = lower + (upper - lower) / 2
            if list[mid] == target {
                return mid
            } else if list[mid] > target {
                upper = mid
            } else if list[mid] < target {
                lower = mid + 1
            }
        }
        return nil
    }
    
    @discardableResult
    static private func linearSearch<T: Comparable>(_ list: [T], target: T) -> Int? {
        var found: Int?
        for i in 0..<list.count {
            if list[i] == target {
                found = i
                break
            }
        }
        return found
    }
    
}
