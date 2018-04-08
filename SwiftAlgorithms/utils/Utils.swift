//
//  Utils.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 3. 16..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation


// MARK: - String Util
extension String {
    
    /// 문자열의 갯수를 반환하는 private 함수. 재귀 호출되는 함수.
    ///
    /// - Parameter str: 갯수를 헤아릴 문자열
    /// - Returns: 문자열 갯수를 계산해서 반환
    fileprivate func counting(_ str: String) -> Int {
        if str.isEmpty {
            return 0
        } else {
            return counting(String(str[str.index(after: str.startIndex)..<str.endIndex])) + 1
        }
    }
    
    /// 문자열 갯수를 반환하는 함수. 이미 count 를 제공하지만 예전 방식처럼 사용하려면 이 프로퍼티에 접근하면 된다.
    var length: Int {
        return counting(self)
    }
    
    /// Range<Int> 를 사용해서 substring 할 수 있도록 구현한 함수
    ///
    /// - Parameter range: String.Index 기반이 아닌 Int 기반 range 를 받는다.
    fileprivate subscript(_ range: Range<Int>) -> String {
        assert((range.lowerBound >= 0 && range.upperBound <= length), "out of range")
        let from = index(startIndex, offsetBy: range.lowerBound)
        let to = index(startIndex, offsetBy: range.upperBound)
        return String(self[from..<to])
    }
    
    /// 시작 위치, 마지막 위치를 지정하는 substring 함수
    ///
    /// - Parameters:
    ///   - from: substring 시작할 위치
    ///   - to: substring 끝낼 위치
    /// - Returns: str[from..<to] 까지의 문자열 반환
    func substring(from: Int, to: Int) -> String {
        //abcdefg
        //0~0 = '', 0~1 = a, 0~2 = ab, 1~1 = '', 1~4 = bcd
        return self[from..<to]
    }
    
    /// 시작 위치, 길이를 지정하는 substring 함수
    ///
    /// - Parameters:
    ///   - from: substring 시작할 위치
    ///   - length: from 에서 부터의 문자열 길이
    /// - Returns: from 부터 length 만큼의 문자열 반환
    func substring(from: Int, length: Int) -> String {
        //abcdefg
        //0, 0 = '', 0, 3 = abc, 3, length = defg
        let to = from + length
        let range = Range<Int>(uncheckedBounds: (lower: from, upper: to))
        return self[from..<range.upperBound]
    }
    
    /// 시작 위치를 지정하여 마지막 문자열까지 substring 하는 함수
    ///
    /// - Parameter from: substring 시작할 위치
    /// - Returns: str[from..<str.length] 까지의 문자열 반환
    func substring(from: Int) -> String {
        print("\(#function) from: \(from)")
        //abcdefg
        //0~length = abcdefg, 1~length = bcdefg, 5~length = fg
        return self[from..<self.length]
    }
    
    /// 마지막 위치를 지정하여 문자열 처음부터 마지막 위치까지 substring 하는 함수
    ///
    /// - Parameter to: substring 끝낼 위치
    /// - Returns: str[0..<to] 까지의 문자열 반환
    func substring(to: Int) -> String {
        print("\(#function) to: \(to)")
        //abcdefg
        //0~0 = '', 0~1 = a, 0~3 = abcd, 0~length = abcdefg
        return self[0..<to]
    }
    
    /// 문자열 반전시키는 함수
    var reverse: String {
        var str = self
        var reversed = ""
        while str.length > 0 {
            reversed += String(str.removeLast())
        }
        return reversed
    }
}

struct SampleData {
    private static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    private static let ArchiveURL = DocumentsDirectory.appendingPathComponent("sampleData")
    
    private static let LINEAR_INT_LIST = "linearIntList"
    private static let RANDOM_INT_LIST = "RandomIntList"
    private static var datas: [String: [Int]]?
    
    static private func getRandomList(_ count: Int) -> [Int] {
        var input = [Int]()
        for _ in 0..<count {
            input.append(Int(arc4random_uniform(UInt32(count))))
        }
        return input
    }
    
    static private func getLinearList(_ count: Int) -> [Int] {
        var input = [Int]()
        for i in 0..<count {
            input.append(i)
        }
        return input
    }
    
    static private func getIntList() {
        if let savedList = NSKeyedUnarchiver.unarchiveObject(withFile: SampleData.ArchiveURL.path) as? [String: [Int]] {
            datas = savedList
        }
    }
    
    
    static func getIntList(_ isRandomList: Bool) -> [Int]? {
        return isRandomList ? datas?[SampleData.RANDOM_INT_LIST] : datas?[SampleData.LINEAR_INT_LIST]
    }
    
    static func makeSampleDatas(_ dataCount: Int) {
        getIntList()
        if datas == nil {
            datas = [String: [Int]]()
            datas![SampleData.RANDOM_INT_LIST] = getRandomList(dataCount)
            datas![SampleData.LINEAR_INT_LIST] = getLinearList(dataCount)
            
            let isSuccess = NSKeyedArchiver.archiveRootObject(datas!, toFile: SampleData.ArchiveURL.path)
            print("sample \(dataCount) datas saved: \(isSuccess ? "success" : "fail")")
        } else {
            print("sample \(dataCount) datas restored")
        }
    }
}
