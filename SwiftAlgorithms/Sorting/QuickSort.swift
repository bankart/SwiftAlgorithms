//
//  QuickSort.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 6..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

struct QuickSort {
    // list = [31, 8, 48, 73, 11, 3, 20, 29, 65, 15] 기준으로 execute 는 16회
    // execute2 는 8회 호출된다.
    // 그리고 execute 는 파티션을 나눌 때 filter 메서드를 사용하므로 함수 호출당 loop 3회로 효율적이지 못하다
    // 반면 execute2 는 파티션을 나눌 때 loop 1회만 순환하므로 훨씬 효율적이다.
    // 고차 함수를 사용 swifty 하게 구현할 수 있으나 비효율적이다.
    // 10000 개 짜리 배열로 테스트해 보면 execute 는 2.23초, execute2 는 0.14초가 소요된다.
    // 100000 개 짜리 배열로 테스트해 보면 3.8 ~ 4.06초, 1.6 ~1.8초 정도가 소요된다.
    func execute<T: Comparable>(_ list: [T]) -> [T] {
        guard list.count > 1 else { return list }
        let pivot = list.last!
        let less = list.filter{ $0 < pivot }
        let equal = list.filter{ $0 == pivot }
        let greater = list.filter{ $0 > pivot }
        return execute(less) + equal + execute(greater)
    }
    
    func execute2<T: Comparable>(_ list: inout [T]){
        quickSort(&list, low: 0, high: list.count - 1)
    }
    
    // 전통적인 방식. 배열 list.count 가 1보다 작으면 sorting 할 필요가 없다.
    // list low ~ high 사이의 원소를 pivot 을 기준으로 큰 값, 작은 값을 나눈다.
    // 이 과정을 반복해서 배열을 정렬한다.
    private func quickSort<T: Comparable>(_ list: inout [T], low: Int, high: Int) {
        if low < high {
            let pivot = partition(&list, low: low, high: high)
            quickSort(&list, low: low, high: pivot - 1)
            quickSort(&list, low: pivot + 1, high: high)
        }
    }
    
    // swapAt, (T1, T2) = (T2, T1) 모두 원소를 치환하는 동일한 동작을 한다. performance 차이는 거의 없다.
    private func partition<T: Comparable>(_ list: inout [T], low: Int, high: Int) -> Int {
        let pivot = list[high]
        var i = low
        for j in low..<high {
            if list[j] < pivot {
//                (list[i], list[j]) = (list[j], list[i])
                list.swapAt(i, j)
                i += 1
            }
        }
        list.swapAt(i, high)
//        (list[i], list[high]) = (list[high], list[i])
        return i
    }
}

