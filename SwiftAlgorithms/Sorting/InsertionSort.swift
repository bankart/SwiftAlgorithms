//
//  InsertionSorting.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 3. 8..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//
//  배열의 첫 번째 원소를 기준으로 자신보다 작은 값들을 앞으로 보내는 방식
//
//


import Foundation

struct InsertionSort {
    func execute<T>(_ list: [T], comparison: (T, T) -> Bool) -> [T] {
        var arr = list
        for i in 1..<arr.count {
//            print("\n\(i) > \(arr)")
            var j = i
            let hold = arr[i]
            while j > 0 && comparison(arr[j-1], hold) {
                arr.swapAt(j, j-1)
                j -= 1
//                print("  >> \(arr)")
            }
            arr[j] = hold
        }
        return arr
    }
}

