//
//  HashSearch.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 8..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

struct HashList {

    private var list: [Int]
    private var hashList: [Int]
    
    init(list: [Int]) {
        self.list = list
        
        hashList = [Int](repeating: -1, count: Int(ceil(Double(self.list.count) * 1.5)))
        print("hashList.count: \(hashList.count)")
        for i in 0..<list.count {
            let element = list[i]
            let index = element % hashList.count
            add(element, at: index)
        }
    }
    
    private mutating func add(_ value: Int, at index: Int) {
        if hashList[index] == -1 {
            print("hashList[\(index)]: \(value)")
            hashList[index] = value
        } else {
            add(value, at: index + 1)
        }
    }
    
    private func get(_ value: Int, at index: Int) -> Int {
        if hashList[index] == value {
            return index
        } else {
            return get(value, at: (index + 1) % hashList.count)
        }
    }
    
    func search(_ value: Int) -> Int {
        let index = value % hashList.count
        return get(value, at: index)
    }
    
    
    func printSelf() {
        print("list: \(list)")
        print("hashList: \(hashList)")
    }
}
