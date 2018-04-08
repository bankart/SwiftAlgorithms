//
//  Palindromes.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 3. 19..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//
//  Palindromes(회문)
//  문자열이 앞에서부터 읽어도 뒤에서부터 읽어도 동일한 단어 또는 단계를 말한다.
//  회문은 대문자, 소문자, 공백, 구두점(콤마 따위), 단어 분할자(a-b 따위) 를 포함한다.
//
//  ex) raceCar => r a c e c a r, r?a?c?e?c?a?r?, RACEcar
//
//  회문 검사는 제시된 문자열중 비문자([^A-Za-z0-9_]) 들을 제거하고 소문자로 치환,
//  처음 문자와 마지막 문자로부터 시작해 중심부로 이동하면서 2개의 문자가 동일한지 아닌지 확인한다.
//

import Foundation

struct Palindromes {
    
    @discardableResult
    static func isPalindrome(_ str: String) -> Bool {
        // 1. "[^A-Za-z0-9_]" 에 매칭되는 문자를 "" 로 치환
        let strippedString = str.replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: nil)
        let length = strippedString.count
        print("origin: \(str)(\(str.count)), remove non-word pattern: \(strippedString)(\(length))")
        if length > 1 {
            return palindrome(strippedString.lowercased(), left: 0, right: length - 1)
        }
        
        return false
    }
    
    private static func palindrome(_ str: String, left: Int, right: Int) -> Bool {
        print("     str: \(str), left: \(left), right: \(right)")
        // 문자열의 중심을 지나칠 때까지 메서드가 호출됐다면 return true
        if left >= right {
            return true
        }
        // (문자열의 중심을 대략 반으로 나누었을 때)왼쪽 문자열에서 중심으로 한 문자씩 이동
        let lhs = str[str.index(str.startIndex, offsetBy: left)]
        // (문자열의 중심을 대략 반으로 나누었을 때)오른쪽 문자열에서 중심으로 한 문자씩 이동
        let rhs = str[str.index(str.startIndex, offsetBy: right)]
        print(      "lhs: \(lhs), rhs: \(rhs)")
        
        // 한 번이라도 다르면 해당 문자열의 회문은 성립하지 않으므로 return false
        if lhs != rhs {
            return false
        }
        
        // 재귀호출로 비교 문자열을 중심부로 이동시키며 비교한다.
        return palindrome(str, left: left + 1, right: right - 1)
    }
}


extension String {
    @discardableResult
    func isPalindrome() -> Bool {
        // 알파벳이 아닌 문자를 제거해야 하는 경우 아래처리 추가해야 하고, 그렇지 않으면 그냥 진행해야 한다. 출제자에게 확인필요.
        // 대소문자 구별에 대한 것도 확인 필요
        let strippedString = self.replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: nil)
        let length = strippedString.count
        print("origin: \(self)(\(count)), remove non-word pattern: \(strippedString)(\(length))")
        if length > 1 {
            return palindrome(strippedString.lowercased(), left: 0, right: length - 1)
        }
        return false
    }
    
    private func palindrome(_ str: String, left: Int, right: Int) -> Bool {
        print("     str: \(str), left: \(left), right: \(right)")
        if left >= right { return true }
        let lhs = str[str.index(str.startIndex, offsetBy: left)]
        let rhs = str[str.index(str.startIndex, offsetBy: right)]
        print(      "lhs: \(lhs), rhs: \(rhs)")
        if lhs != rhs { return false }
        return palindrome(str, left: left + 1, right: right - 1)
    }
}

