//
//  Quiz4.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 4..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

func testSample4() {
    print("\(#function)")
    /*
     [self + help]
     정수(int)가 주어지면, 팰린드롬(palindrome)인지 알아내시오. 팰린드롬이란, 앞에서부터 읽으나 뒤에서부터 읽으나 같은 단어를 말합니다. 단, 정수를 문자열로 바꾸면 안됩니다.
     
     예제)
     Input: 12345
     Output: False
     
     Input: -101
     Output: False
     
     Input: 11111
     Output: True
     
     Input: 12421
     ﻿Output: True
     
     // https://mailprogramming.com/solution/4?email=bankart0218@gmail.com&token=b811a7d028ff14ce548b5c56f6ccc7adaf1b52ecd00da01df87e125c381a397a
     */
    
    @discardableResult
    func isPalindrome(_ num: Int) -> Bool {
        guard num > 0, num % 10 != 0 else {
            print("num: \(num)")
            return false
        }
        var num = num
        var half = 0
        let const = 10
        print(num, half)
        while num > half {
            half = (half * const) + (num % const)
            num /= const
            print(num, half)
        }
        return num == half || num == half / 10
    }
    var result = isPalindrome(-101)
    print(result)
    result = isPalindrome(12345)
    print(result)
    result = isPalindrome(11111)
    print(result)
    result = isPalindrome(12421)
    print(result)
}

