//
//  Permutations.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 3. 19..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//
/*
 순열(Permutation)
 ex) a, b, c, d, e 는 알파벳의 순열.
 b, e, d, a, c 또한 알파벳의 순열.
 n 개의 오브젝트로 이루어진 컬렉션의 순열은 n!
 그러므로 위 예제로 든 5자리의 알파벳에 대한 순열은 5 * 4 * 3 * 2 * 1 = 120 가지이다.
 
 5개의 문자가 있고 이를 어떤 순서로 정렬하고 싶면 문자를 하나씩 비교하는 수 밖에 없다. "a, b, c, d, e" 5가지의 선택지 중 하나를 선택할 수 있다.
 첫 번째 문자를 선택하고 난 후엔 4개의 문자 중 선택하면 된다. 이때는 5 * 4 = 20 개의 선택지가 존재한다.
 {
 a+b, b+a, c+a, d+a, e+a
 a+c, b+c, c+b, d+b, e+b
 a+d, b+d, c+d, d+c, e+c
 a+e, b+e, c+e, d+e, e+d
 }
 
 두 번째 문자를 선택하면, 3개의 문자 중 선택하면 되고... 이런 과정을 반복하면 된다. 마지막 문자를 선택할 때가 되면 실제로는 선택하지 않아도 된다. 왜냐하면
 가능한 순열은 5 * 4 * 3 * 2 * 1 이기 때문에 마지막 한 가지의 가능성은 큰 의미가 없다.

 위의 과정을 식으로 바꿔보면
 p(n, k) = n! / (n-k)!
 
 3 번째 문자까지 선택했다면
 p(5, 3) = 5! / 2! = 120 / 2 = 60
 
 */
//
//

import Foundation

struct Permutations {
    // 위의 설명에서 나온 식을 적용하면 n 과 k 의 차이가 크지 않은 경우 Int 타입의 range 한계를 벗어난 factorial 계산이 가능하다.
    // 하지만 permutation(30, 15) 처럼 실제로 Int 의 range 를 벗어나는 계산을 할 경우 overflow 가 발생한다.
    // purmutation(50, 6) = 50 * 49 * 48 * 47 * 46 * 45 = 11,441,304,000
    func purmutation(_ n: Int, _ k: Int) -> Int {
        var n = n
        var answer = n
        for _ in 1..<k {
            n -= 1
            answer *= n
        }
        return answer
    }
    
    /*
     a = ["a", "b", "c"], n = 2 인 경우
     ["a", "b", "c"]
     ["b", "a", "c"]
     ["c", "b", "a"]
     ["b", "c", "a"]
     ["a", "c", "b"]
     ["c", "a", "b"]
     */
    var depth = 0
    mutating func permuteWirth<T>(_ a: [T], _ n: Int) {
        let tab = String(repeating: "\t", count: depth)
        if n == 0 {
            depth += 1
            print("\(tab)\(depth)> finish one cycle: \(a)")
            depth -= 1
        } else {
            depth += 1
            var a = a
            let _n = n - 1
            permuteWirth(a, _n)
            print("\(tab)\(depth)> source = \(a), \(_n)")
            print("start loop to \(n)")
            for i in 0..<n {
                a.swapAt(i, n)
                print("\(tab)\(depth)> swapped > i = \(i), source = \(a)")
                permuteWirth(a, _n)
                a.swapAt(i, n)
                print("\(tab)\(depth)> restored > i = \(i), source = \(a)")
            }
            print("finish loop to \(n)")
            depth -= 1
        }
    }
    
    func permutation<T>(list: [T], n: Int) {
        print(#function)
        var result = [[T]]()
        func permute(arr: [T], n: Int) {
            if n == arr.count - 1 {
                // swap 완료된 경우
                result.append(arr)
            } else {
                var list = arr
                for i in n..<list.count {
                    // swap 1
                    list.swapAt(i, n)
                    // swap 2
                    permute(arr: list, n: n + 1)
                    // swap 1 원복.
                    list.swapAt(i, n)
                }
            }
        }
        permute(arr: list, n: n)
        print(result)
    }
    
}
