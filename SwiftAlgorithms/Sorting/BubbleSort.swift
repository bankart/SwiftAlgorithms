//
//  BubbleSort.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 6..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//
//  배열의 마지막 원소부터 시작해서 자신보다 앞에 있는 원소와 비교해 크면 위치를 바꿔 나간다.
//

import Foundation

struct BubbleSort {
    func execute<T: Comparable>(_ list: [T], comparison: (T, T) -> Bool) -> [T] {
        var arr = list
        var pivot = 0
        while pivot < arr.count {
//            print("\npivot: \(pivot), \(arr)")
            for i in stride(from: arr.count - 1, through: pivot + 1, by: -1) {
                if comparison(arr[i], arr[i-1]) {
                    arr.swapAt(i, i-1)
                }
//                print("  \(i), \(arr)")
            }
            pivot += 1
        }
        return arr
    }
}
