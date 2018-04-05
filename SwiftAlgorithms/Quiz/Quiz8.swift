//
//  Quiz8.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 4..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

func testSample8() {
    print("\n\n")
    /*
     정수 배열(int array)이 주어지면 두번째로 큰 값을 프린트하시오.
     예제)
     Input: [10, 5, 4, 3, -1]
     Output: 5
     
     Input: [3, 3, 3]
     Output: Does not exist.
     
     // https://mailprogramming.com/solution/8?email=bankart0218@gmail.com&token=6b1afa3b817950028fc7767184158d8979bfaebf14314c612ee99da134f4ce55
     */
    let input = [10, 5, 4, 3, -1]
    let input2 = [3, 3, 3]
    var input3 = [Int](repeating:1, count:30)
    input3 = input3.map{
        let randomNumber = Int(arc4random_uniform(60))
        var transformed: Int = ($0 * randomNumber)
        transformed -= (randomNumber / 2)
        transformed = transformed * ((transformed % 2 == 0) ? 1 : -1)
        return transformed
    }
    
    print(input3)
    print()
    
    func linearSearch(_ targets: [Int]) -> Int? {
        var totalCount: Int = 0
        var temp: Int = targets.first!
        var found: Int?
        for i in 1..<targets.count {
            let target = targets[i]
            if target > temp {
                found = temp
                temp = target
            } else {
                if found == nil {
                    found = target
                } else {
                    if found! < target {
                        found = target
                    }
                }
            }
            if found == temp {
                found = nil
            }
            totalCount += 1
        }
        print("found: \(found), temp: \(temp)")
        print("total search count: \(totalCount) / \(targets.count)")
        return found
    }
    print("\ninput count = \(input.count)")
    print(linearSearch(input))
    print("\ninput count = \(input2.count)")
    print(linearSearch(input2))
    print("\ninput count = \(input3.count)")
    print(linearSearch(input3))
    print("\n\n")
    
    
    func performanceSearch(_ arr: [Int]) -> Int? {
        var totalCount: Int = 0
        var bigger: Int?, big: Int?
        var found: Int?
        var leftIndex: Int = 0
        var rightIndex: Int = arr.count - 1
        while leftIndex < rightIndex {
            if bigger == nil, big == nil {
                let result = arr[leftIndex] > arr[rightIndex]
                bigger = result ? arr[leftIndex] : arr[rightIndex]
                big = result ? arr[rightIndex] : arr[leftIndex]
            } else {
                if arr[leftIndex] > bigger! {
                    big = bigger
                    bigger = arr[leftIndex]
                } else if arr[leftIndex] > big! {
                    big = arr[leftIndex]
                }
                
                if arr[rightIndex] > bigger! {
                    big = bigger
                    bigger = arr[rightIndex]
                } else if arr[rightIndex] > big! {
                    big = arr[rightIndex]
                }
            }
            if bigger == big {
                found = nil
            } else {
                found = big
            }
            leftIndex += 1
            rightIndex -= 1
            totalCount += 1
            print("bigger: \(bigger), big: \(big), found: \(found)")
        }
        print("= result =")
        print("bigger: \(bigger), big: \(big), found: \(found)")
        print("total search count: \(totalCount) / \(arr.count)")
        return found
    }
    print("input count = \(input.count)")
    print(performanceSearch(input))
    print("\ninput count = \(input2.count)")
    print(performanceSearch(input2))
    print("\ninput count = \(input3.count)")
    print(performanceSearch(input3))
    
    print("\n\n")
}
