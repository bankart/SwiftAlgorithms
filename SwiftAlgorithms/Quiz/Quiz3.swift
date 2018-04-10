//
//  Quiz3.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 4..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

func testSample3() {
    print("\(#function)")
    /*
     [help]
     정수 n이 주어지면, n개의 여는 괄호 "("와 n개의 닫는 괄호 ")"로 만들 수 있는 괄호 조합을 모두 구하시오. (시간 복잡도 제한 없습니다).
     예제)
     Input: 1
     Output: ["()"]
     
     Input: 2
     Output: ["(())", "()()"]
     
     Input: 3
     Output: ["((()))", "(()())", "()(())", "(())()", "()()()"]
     // https://mailprogramming.com/solution/3?email=bankart0218@gmail.com&token=1dbd0a251ad58f95dad461301107299bf094e8e1a48bb4a4a0ca34b87155e3c1
     */
    
    
    func makeParenthesis(with list: inout [String], parenthesis: String, open: Int, close: Int, targetNumber: Int) {
        print("\(#function) \(parenthesis)")
        // 문자열 길이(괄호 갯수)가 targetNumber * 2 인 경우는 배열에 추가
        if parenthesis.count == targetNumber * 2 {
            list.append(parenthesis)
            return
        }
        // targetNumber 보다 열린 괄호가 적으면 parenthesis + "(" 로 재귀 호출
        if open < targetNumber {
            makeParenthesis(with: &list, parenthesis: parenthesis + "(", open: open + 1, close: close, targetNumber: targetNumber)
        }
        // 닫힌 괄호 갯수가 열린 괄호 갯수보다 작으면 parenthesis + ")" 로 재귀 호출
        if close < open {
            makeParenthesis(with: &list, parenthesis: parenthesis + ")", open: open, close: close + 1, targetNumber: targetNumber)
        }
    }
    
    var list = [String]()
    makeParenthesis(with: &list, parenthesis: "", open: 0, close: 0, targetNumber: 3)
    print(list)
}

