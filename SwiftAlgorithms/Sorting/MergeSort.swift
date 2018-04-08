//
//  MergeSort.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 6..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//
//  1. 배열의 중간 원소를 찾아서 해당 값보다 작은 원소는 왼쪽에, 큰 원소는 오른쪽에 위치시킴
//  2. 1의 과정을 배열이 1개의 원소만 가질때 까지 반복한 후 배열들을 합치면서 작은 값을 정렬시킴
//
//  참고 영상 링크: https://youtu.be/2YvFRAC8UTM
//
//  100000 개 짜리 배열로 테스트시 2.83초 정도 소요된다.
//

import Foundation

class MergeSort {
    func execute<T: Comparable>(_ list: [T]) -> [T] {
        guard list.count > 1 else { return list }
        let middle = list.count/2
        let left = execute(Array(list[..<middle]))
        let right = execute(Array(list[middle...]))
        return merge(leftPile: left, rightPile: right)
    }
    
    private func merge<T: Comparable>(leftPile: [T], rightPile: [T]) -> [T] {
        var leftIndex = 0, rightIndex = 0
        var orderedPile = [T]()
        
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            } else {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < leftPile.count {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
        return orderedPile
    }
}
