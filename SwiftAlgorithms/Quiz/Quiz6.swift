//
//  Quiz6.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 4..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

func testSample6() {
    /*
     주어진 string 에 모든 단어를 거꾸로 하시오.
     예제)
     Input: “abc 123 apple”
     Output: “cba 321 elppa”
     
     // https://mailprogramming.com/solution/7?email=bankart0218@gmail.com&token=0ff6487e598ee4320cae6984d924e40a418346a914d73b9dc3bf9a15ec2bdc4f
     */
    
    var input0: String = "abc 123 apple"
    print("original string: \(input0)")
    print()
    let reversedString = input0.components(separatedBy: " ").map { (str) -> String in
        print("origin: \(str)")
        var reversed = str.reversed()
        print("reversed: \(reversed)")
        return String(reversed)
        }.reduce("") { (result, str) -> String in
            "\(result)\(str) "
    }
    print("use built-in method: \(reversedString)")
    
    func reverse(str: String) -> String {
        var components = str.components(separatedBy: " ")
        print("components: \(components)")
        for i in 0..<components.count {
            var stack = [Character]()
            let part = components[i]
            for char in part {
                stack.append(char)
            }
            print("stacked: \(stack)")
            var reversed = [Character]()
            for i in stride(from: stack.count-1, through: 0, by: -1) {
                reversed.append(stack[i])
            }
            print("reversed: \(reversed)")
            components[i] = String(reversed)
        }
        print("components: \(components)")
        return components.reduce(""){
            "\($0)\($1) "
        }
    }
    print()
    print("use method0: \(reverse(str: input0))")
    print("\n\n")
}

