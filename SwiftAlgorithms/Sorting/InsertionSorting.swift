//
//  InsertionSorting.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 3. 8..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//
//  list = [56, 17, 63, 34, 77, 52, 58]
//  i = 1, j = i-1 > 0, temp = list[j=0] > 56, list[i=1] = 17
//  while j >= 0 && list[j] > temp >> while 0 >= 0 && 56 > 17
//  list[j+1=1] = temp > 56, j = j-1 > -1 then stop while
//  list[j+1=0] = temp >> list[0] = 17, list[1] = 56
//  > [56, 17, 63, 34, 77, 52, 58]
//  > [17, 56, 64, 34, 77, 52, 58]

//  > [17, 56, 64, 34, 77, 52, 58]
//  > [17, 56, 34, 64, 77, 52, 58]
//  > [17, 34, 56, 64, 77, 52, 58]
//  > [17, 34, 56, 64, 77, 52, 58]
//  > [17, 34, 56, 64, 52, 77, 58]
//  > [17, 34, 56, 52, 64, 77, 58]
//  > [17, 34, 52, 56, 64, 77, 58]
//
//
//


import Foundation

struct Sorting {
    func insertionSorting(list: [Int]) -> [Int] {
        var arr = list
        for i in 1..<list.count {
            print("i: \(i)")
            var j = i
            let temp = arr[j]
            print("hold: \(temp)")
            while j > 0 && temp < arr[j - 1] {
                print("j: \(j), \(temp) > \(arr[j-1])")
                arr[j] = arr[j - 1]
                j -= 1
            }
            print("after while j: \(j)")
            arr[j] = temp
            print(arr)
        }
        return arr
    }
    
    func insertionSort<T>(_ arr: [T], isOrderedBefore: (T, T) -> Bool) -> [T] {
        var list = arr
        for i in 1..<arr.count {
            var j = i
            let hold = arr[j]
            while j > 0 && isOrderedBefore(hold, list[j - 1]) {
                list[j] = list[j-1]
                j -= 1
            }
            list[j] = hold
        }
        return list
    }
    
    func execute() {
        let list = [56, 17, 63, 34, -1, 77, 52, 58]
        print("after insertion sorting: \(insertionSorting(list: list))")
        print("내림차순: \(insertionSort(list, isOrderedBefore: <))")
        print("오름차순: \(insertionSort(list, isOrderedBefore: >))")
    }
}
