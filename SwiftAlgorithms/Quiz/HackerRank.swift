//
//  HackerRank.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 4. 10..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation

struct FirstExperience {
    /// 주어진 배열의 원소중 k 값을 찾아라. 있으면 YES, 없으면 NO 를 반환하라
    func findNumber(arr: [Int], k: Int) -> String {
        var result = "NO"
        var left = 0, right = arr.count - 1
        while left < right {
            if arr[left] == k || arr[right] == k {
                result = "YES"
            }
            if arr[left] != k {
                left += 1
            }
            if arr[right] != k {
                right -= 1
            }
        }
        return result
    }
//    let result = findNumber(arr: [2, 3, 1], k: 5)
//    print(result)
    
    /// 주어진 l, r 을 포함하는 두 수 사이의 정수중 홀수인 경우만 출력하라
    func oddNumbers(l: Int, r: Int) -> [Int] {
        var odds = [Int]()
        for number in l...r {
            if number % 2 != 0 {
                odds.append(number)
            }
        }
        return odds
    }
//    let odds = oddNumbers(l: 2, r: 9)
//    print("odd numbers: \(odds)")
    
}


struct WarmingUp {
    
//    let arr = [[11, 2, 4], [4, 5, 6], [10, 8, -12]]
    /// 주어진 배열의 원소를 X 형태의 사선으로 접근하여 각 대각선에 위치한 원소들의 값을 더하는 문제
    func diagonalDifference(a: [[Int]]) -> Int {
        /*
         * Write your code here.
         */
        
        var sumOfDigonal0 = 0, sumOfDigonal1 = 0
        var left = 0, right = a.count - 1
        while (left < a.count && right >= 0) {
            sumOfDigonal0 += a[left][right]
            print("\(sumOfDigonal0) += arr[\(left)][\(right)] = \(a[left][right])")
            sumOfDigonal1 += a[right % a.count][right]
            print("\(sumOfDigonal1) += arr[\(right % a.count)][\(right)] = \(a[right % a.count][right])\n")
            left += 1
            right -= 1
        }
        print(sumOfDigonal0, sumOfDigonal1)
        return abs(sumOfDigonal0 - sumOfDigonal1)
    }
//    print(diagonalDifference(a: arr))
    
    
    // 주어진 배열에 존재하는 양수, 음수, 0 의 출현 비율을 출력하는 문제
    func plusMinus(arr: [Int]) -> Void {
        enum Key: UInt8 {
            case positive = 0, negative, zero
        }
        
        var comp = [Key.positive: 0.0, .negative: 0.0, .zero: 0.0]
        for number in arr {
            if number > 0 {
                comp[.positive]! += 1
            } else if number < 0 {
                comp[.negative]! += 1
            } else {
                comp[.zero]! += 1
            }
        }
        let total = Double(arr.count)
        let sortedKeys = comp.keys.sorted { (key0, key1) -> Bool in
            key0.rawValue < key1.rawValue
        }
        for key in sortedKeys {
            print(comp[key]! / total)
        }
    }
//    plusMinus(arr: [-4, 3, -9, 0, 4, 1])
    
    
    /// # 찍기
    func staircase(n: Int) -> Void {
        for row in 0..<n {
            var asterisks = ""
            for col in 1...n {
                if col / (n - row) == 0 {
                    asterisks += " "
                } else {
                    asterisks += "#"
                }
            }
            print(asterisks)
        }
        
    }
//    print("=====================")
//    staircase(n: 6)
    
    
    // 주어진 수열 중 가장 작은 값의 조합값, 큰 값의 조합값을 출력
    func miniMaxSum(arr: [Int]) {
        var minimum = 0, maximum = 0
        for i in 0..<arr.count {
            print("i: \(i)")
            var j = 0, sum = 0
            while j < arr.count {
                if i != j {
                    sum += arr[j]
                }
                j += 1
            }
            print("sum: \(sum)")
            if i == 0 {
                minimum = sum
                maximum = sum
            } else {
                minimum = min(minimum, sum)
                maximum = max(maximum, sum)
            }
        }
        print(minimum, maximum)
    }
    
    //        miniMaxSum(arr: [1, 2, 3, 4, 5])
    //        miniMaxSum(arr: [5, 5, 5, 5, 5])
    
    
    // 케익 촛불 중 큰 것만 끌 수 있는데, 몇 개나 끌 수 있는지?
    func birthdayCakeCandles(n: Int, ar: [Int]) -> Int {
        guard ar.count > 0 else { return ar.count }
        var height = ar.first!
        var taller = height
        var pairs = [height : 1]
        for i in 1..<ar.count {
            height = ar[i]
            if pairs[height] != nil {
                pairs[height]! += 1
                taller = height
            } else {
                pairs[height] = 1
            }
        }
        print(pairs)
        return pairs[taller]!
    }
    //        let input = [3, 2, 1, 3]
    //        print("count: \(birthdayCakeCandles(n: input.count, ar: input))")
    
    
    // 12시간 체계를 24시간 체계로 변환
    func timeConversion(s: String) -> String {
        print("input >> \(s)")
        let mStrIndex = s.index(of: "M")!
        let timeFormat = String(s[s.index(before: mStrIndex)...mStrIndex])
        let timeString = s.replacingOccurrences(of: timeFormat, with: "")
        var timeParts = timeString.components(separatedBy: ":")
        print("timeString: \(timeString)")
        // 12:00:00AM -> 00:00:00, 12:00:00PM -> 12:00:00
        var hour = Int(timeParts.first!)!
        let twelve = 12
        if s.range(of: "PM") != nil {
            // pm
            if hour >= 12 {
                hour += (hour % twelve)
            } else {
                hour += twelve
            }
        } else {
            // am
            hour = hour % twelve
        }
        timeParts[0] = hour < 10 ? "0\(hour)" : "\(hour)"
        return timeParts[0] + ":" + timeParts[1] + ":" + timeParts[2]
    }
//    var time = "12:40:22AM"
//    var result = timeConversion(s: time)
//    print("result: \(result)")
//    time = "07:05:45PM"
//    result = timeConversion(s: time)
//    print("result: \(result)")
    
    
    
    // 허들 게임에서 캐릭터가 먹어야하는 약의 수 구하기
    /*
     hackerrank 에서 stdin, stdout 문제 나오면 아래와 같이 변수를 받아야 함
     let firstLine = Array(readLine()!).split(separator: " ").map{ Int(String($0))! }
     
     let n = firstLine.first!
     let k = firstLine.last!
     let hurdles = Array(readLine()!).split(separator: " ").map{ Int(String($0))! }
     
     var count = 0
     for i in 0..<n {
     if Int(String(hurdles[i]))! > k {
     count += 1
     }
     }
     print(count)
     */
    func checkPortionCount(n: Int, k: Int, hurdles: [Int]) -> Int {
        var count = 0
        for num in hurdles {
            if num > k {
                count += 1
            }
        }
        return count
    }
    
    
    /*
     pdf viewer 를 만든다. 문자 마다 다른 height 를 가지는데 가장 높은 height 를 가지는 문자를 기준으로 배경 하이라이트를 그려야한다.
     모든 문자는 모두 1mm 의 widht 값을 가진다.
     예를 들어 abcd 라는 문자가 있고 각 문자의 height 는 [1, 3, 1, 3] 이라면 하이라이트의 rect 는 4 * 1 * 3 = 12 가 된다.
     면적을 출력하라
     
     let charSizes = Array(readLine()!).split(separator: " ").compactMap { Int(String($0)) }
     let words = Array(readLine()!).map { String($0) }
     let alphabets = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
     
     let sizeMap = zip(alphabets, charSizes)
     var maxSize = 0
     for (word, size) in sizeMap {
     for char in words {
     if word == char {
     maxSize = max(maxSize, size)
     break
     }
     }
     }
     
     print(words.count * 1 * maxSize)
     
     */
    
    @discardableResult
    func gradingStudents(grades: [Int]) -> [Int] {
        var modified = [Int](repeating: 0, count: grades.count)
        for i in 0..<grades.count {
            let grade = grades[i]
            if grade >= 38 {
                var digit = grade / 10
//                print("grade: \(grade), digit: \(digit)")
                digit = (grade % 10) > 5 ? (digit + 1) * 10 : (digit * 10) + 5
//                print("grade: \(grade), digit: \(digit)")
//                print("\(digit) - \(grade) = \(digit - grade), \(grade) % 10 = \(grade % 10)")
                let difference = digit - grade
                if difference < 3 {
                    modified[i] = grade + difference
                } else {
                    modified[i] = grade
                }
            } else {
                modified[i] = grade
            }
        }
        return modified
    }
    
    
    /*
     first line: sam's housr start point "s", end point "t"
     second line: apple tree's point "a", orange tree's point "b"
     third line: number of dropped apples "m", number of dropped oranges "n"
     fourth line: contains "m", respective distance that each apple falls from point "a"
     fifth line: contains "n", respective distance that each orange falls from point "b"
     
     print
     first line: the number of apples that falls on sam's house
     second line: the number of oranges that falls on sam's house
     7 11
     >> sam's house range 7 < house <= 11
     5 15
     >> apple tree's point 5, orange tree's point 15
     3 2
     >> dropped apples count 3, dropped oranges count 2
     -2 2 1
     >> drop points of apples
     5 -6
     >> drop points of oranges
     */
    func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) {
        let houseArea = s...t
        func countFruits(_ houseRange: CountableClosedRange<Int>, treePoint: Int, fruits: [Int]) -> Int {
            var count = 0
            for dropPoint in fruits {
                if houseRange.contains(treePoint + dropPoint) {
                    count += 1
                }
            }
            return count
        }
        
        print(countFruits(houseArea, treePoint: a, fruits: apples))
        print(countFruits(houseArea, treePoint: b, fruits: oranges))
    }
    
    /*
     인수 구하기
     a = [2, 4]
     b = [16, 32, 96]
     >> 3
     
     a 의 모든 원소는 b 원소의 인수이다.
     2와 4는 고르게 4,8,12,16으로 나뉜다.
     4,8,16은 16,32,96으로 고르게 나뉘어 진다.
     4,8,16은 A의 각 요소가 하나의 인수이고, 각 요소는 B의 모든 요소의 인수이다.
     
     */
    @discardableResult
    func getTotalX(a: [Int], b: [Int]) -> Int {
        func isFactor(_ a: Int, of b: Int) -> Bool {
            return b % a == 0
        }

        let listA = a.sorted()
        let listB = b.sorted()
        print("sorted a: \(listA)")
        print("sorted b: \(listB)")
        
//        let maxA = listA.last!
//        let minB = listB.first!
//        print("maxA: \(maxA), minB: \(minB)")
//        var interestNumber = 0
//
//        firstLoop:
//        for i in stride(from: maxA, through: minB, by: maxA) {
//            print("target: \(i)")
//            for num in listA {
//                print("\t\(i) % \(num) = \(i % num)")
//                if i % num != 0 {
//                    print("can't")
//                    continue firstLoop
//                }
//            }
//
//            for num in listB {
//                print("\t\(i) % \(num) = \(i % num)")
//                if i % num != 0 {
//                    print("can't")
//                    continue firstLoop
//                }
//            }
//
//            interestNumber += 1
//        }
//        print("interestNumber: \(interestNumber)")
//        return interestNumber
        return 0
    }
    
    // 특정 test case 에서 실패한다고 나오는데 해당 input 을 받아서 직접 돌려보면 정상동작 ㅡ,.ㅡ;;;;; 아무리해도 통과시킬 수 없다.
    func breakingRecords(score: [Int]) -> [Int] {
        print("\(#function)")
        guard score.count > 1 else { return score }
        var minScore = score.first!, maxScore = minScore
        var minCount = 0, maxCount = 0
        for i in 1..<score.count {
            let s = score[i]
            if s < minScore {
                minCount += 1
                minScore = s
            } else if s > maxScore {
                maxCount += 1
                maxScore = s
            }
            print("score: \(s), min: \(minScore), max: \(maxScore)")
        }
        return [maxCount, minCount]
    }
    
    
    func chocoBarCounts(length: Int, chocoBars: [Int], birthDayInfos: [Int]) {
        var sum = 0, sumCount = 0, result = 0
        print("\nchocoBars: \(chocoBars), birthDay: \(birthDayInfos.last!) month, \(birthDayInfos.first!) day")
//        for i in 0..<chocoBars.count {
//            print("loop - \(i)")
//            for j in stride(from: i, to: chocoBars.count, by: 1) {
//                sum += chocoBars[j]
//                sumCount += 1
//                print("\tinner loop - \(j) sum: \(sum), sumCount: \(sumCount)")
//                if sumCount == birthDayInfos.last! && sum == birthDayInfos.first! {
//                    result += 1
//                    print("\tchocoBars[\(j)] = \(chocoBars[j]), sum: \(sum), sumCount: \(sumCount)")
//                    sum = 0
//                    sumCount = 0
//                    break
//                }
//            }
//            sum = 0
//            sumCount = 0
//        }
        
        var i = 0, j = 0
        let resetBlock = {
            i += 1
            j = i
            sumCount = 0
            sum = 0
        }
        while i < chocoBars.count {
            if sumCount == birthDayInfos.last! && sum == birthDayInfos.first! {
                result += 1
                resetBlock()
                continue
            }
            if j == chocoBars.count - 1 {
                resetBlock()
                continue
            }
            sum += chocoBars[j]
            sumCount += 1
            j += 1
//            print("\tloop[\(i)], sum: \(sum), sumCount: \(sumCount), result: \(result)")
        }
        
        print("result: \(result)")
    }
    
    
    // Divisible Sum Pairs
    func divisibleSumPairs(length: Int, divider: Int, input: [Int]) {
        print("\n\(#function)")
        var result = 0
        for i in 0..<length {
            let num0 = input[i]
            for j in stride(from: i+1, to: length, by: 1) {
                let num1 = input[j]
//                print("loop[\(i)] - num0: \(num0), num1: \(num1), num0 + num1 / divider: \((num0 + num1) % divider)")
                if (num0 + num1) % divider == 0 {
                    result += 1
                }
            }
        }
        print("result: \(result)")
    }
    
    /*
     새 타입별 특정 int 값을 id 로 가진다.
     특정 종류의 새가 나타날 때마다, 이 새의 id 는 관측목록에 추가된다.
     어떤 새가 가장 많이 목격되는가. 새의 종률를 출력하라
     만약 목격 횟수가 동일한 새의 종류가 있다면 id 값이 작은 새를 출력하라
     */
    func migratoryBirds(n: Int, ar: [Int]) -> Int {
        var sightings = [Int:Int]()
        for typeOfBird in ar {
            if sightings[typeOfBird] != nil {
                sightings[typeOfBird]! += 1
            } else {
                sightings[typeOfBird] = 1
            }
        }
        print(sightings)
        
        let result = sightings.sorted { element0, element1 -> Bool in
            if element0.value == element1.value {
                if element0.key < element1.key {
                    return true
                } else {
                    return false
                }
            } else if element0.value > element1.value {
                return true
            } else {
                return false
            }
        }
        print(result)
        return result.first!.key
    }
    
    
    /*
     나무는 매년 2번의 자람 사이클을 가진다. 봄에는 높이가 2배가 되고, 여름에는 높이가 1미터 자란다.
     로라 식물원은 봄에 1미터짜리 어린 나무를 심는다. 나무가 n 번의 자람 사이클을 지났을 때 얼마나 자라있겠는가
     첫 번째 라인, t 는 테스트 케이스 횟수
     그 다음 라인, n 은 각 테스트 케이스의 자람 사이클 횟수
     
     3
     0, 1, 4
     
     1
     2
     */
    func utopianTree(_ cyclesOfTestCase: [Int]) {
        print(#function)
        func sumOfCycles(_ cycles: Int) -> Int {
            var heightOfSaplingTree = 1
            for i in 0..<cycles {
                if i % 2 == 0 {
                    heightOfSaplingTree *= 2
                } else {
                    heightOfSaplingTree += 1
                }
            }
            return heightOfSaplingTree
        }
        
        for cycle in cyclesOfTestCase {
            print("\n\tcycle: \(cycle): \(sumOfCycles(cycle))")
        }
    }
    
    /*
     배열 뒤집기
     */
    func reverseArray(a: [Int]) -> [Int] {
        var temp = [Int]()
        for i in stride(from: a.count - 1, through: 0, by: -1) {
            temp.append(a[i])
        }
        return temp
    }
    
    
    /*
     2차원 배열 검색
     */
    @discardableResult
    func array2D(arr: [[Int]]) -> Int {
        var result = -Int.max, sum = 0
        var cursor = 0
        let col = 3, row = 3, totalSize = (col + 1) * (row + 1), hourGlassGridSize = col * row
        var index = 0
        
        while cursor < totalSize {
            print("check \(cursor) hourGlass")
            hourGlassLoop: while index < hourGlassGridSize {
                let rowIndex = (index / row) + (cursor / (row + 1))
                let columIndex = (index % col) + cursor % (col + 1)
                if columIndex < arr[rowIndex].count {
                    if (index / row) == 1, (index % col) != 1 {
                        index += 1
                        continue hourGlassLoop
                    }
                    sum += arr[rowIndex][columIndex]
                    index += 1
                } else {
                    break
                }
            }
            result = max(result, sum)
            print("sum: \(sum), result: \(result)")
            sum = 0
            index = 0
            cursor += 1
        }
        
        return result
    }
    
    /*
     배열 회전
     */
    func leftRotation(input: [Int], perform: Int) -> [Int] {
        var arr = input
        for _ in 0..<perform {
            let temp = arr.removeFirst()
            arr.append(temp)
        }
        return arr
    }
    
    /*
     아마도 카카오에서 제출한 findSimilar 문제가 이걸 응용한 것 같다. 문제 이해하는데 한참 걸림.... 이해력이 이렇게 떨어질 줄이야..
     비슷한 문자열 찾기
     1. 길이가 같은 문자열
     2. 유효한 indices 쌍이 문자열에 존재함
     ex) 문자열 a = 'adba', b = 'bcgb' 는 비슷한 문자열.
         a[0] == a[3], b[0] == b[3] (i, j) 는 동일한 문자열이고 그 외에는 모두 다른 문자열들은 모두 a[i] != a[j], b[i] != b[j] 이다.
     similar as for i = 0, j = 3, a[0] == a[3] and b[0] == b[3]
     and for all other i, j pairs a[i] != a[j] as well as b[i] != b[j].
     
     문자열 giggabaj 에 대해
     (i = 1, j = 1) > 8쌍 존재
     (i = 1, j = 2) > 6쌍 존재
     (i = 1, j = 3) > 2쌍 존재
     (i = 2, j = 4) > 1쌍 존재
     
     HackerRank editor 에 미리 작성된 코드에서 에러 발생... 대체 입력 받을 string 은 어디에 있는지 알 수도 없고.... advanced 문제인데 내 점수 ㅠ ㅠ
     */
    @discardableResult
    func similarStrings(n: Int, s: String, queries: [[Int]]) -> [Int] {
        func getSubstrings(from string: String, with queries: [[Int]]) -> [String] {
            return queries.map {
                let start = string.index(string.startIndex, offsetBy: $0.first!-1)
                let end = string.index(start, offsetBy: $0.last! - $0.first!)
                return String(string[start...end])
            }
        }
        
        func getAllSubstrings(from str: String, with queries: [[Int]]) -> [[String]] {
            var subStrings = [[String]]()
            queries.forEach {
                let start = $0.first!, end = $0.last!
                var strings = [String]()
                for i in 0..<str.count - (end-start) {
                    let startIndex = str.index(str.startIndex, offsetBy: i)
                    let endIndex = str.index(startIndex, offsetBy: end-start)
                    let string = String(str[startIndex...endIndex])
                    strings.append(string)
                }
                subStrings.append(strings)
            }
            return subStrings
        }
        
        func getMatchSequence(chars: [Character]) -> [Int:Bool] {
            var seq = [Int:Bool]()
            var i = 0
            while i < chars.count {
                if i == chars.count - 1 {
                    seq[i] = chars[i] == chars[0]
                } else {
                    seq[i] = chars[i] == chars[i + 1]
                }
                i += 1
            }
            
            return seq
        }
        
        func isMatch(chars0: [Character], chars1:[Character]) -> Bool {
            let matchSeq0 = getMatchSequence(chars: chars0)
            let matchSeq1 = getMatchSequence(chars: chars1)
            return matchSeq0 == matchSeq1
        }
        
        var matches = [Int]()
        let subStrings = getSubstrings(from: s, with: queries)
        let allSubstrings = getAllSubstrings(from: s, with: queries)
        for i in 0..<subStrings.count {
            let givenChars = Array(subStrings[i])
            let targetChars = allSubstrings[i].map { Array($0) }
            var matchCount = 0
            for chars in targetChars {
                if isMatch(chars0: chars, chars1: givenChars) {
                    matchCount += 1
                }
            }
            print(matchCount)
            matches.append(matchCount)
        }
        
        return matches
    }
    
    func permute<T>(input: [T], n: Int) -> [[T]] {
        var list = [[T]]()
        func permutation(input: [T], n: Int) {
            var arr = input
            if n == arr.count - 1 {
                list.append(arr)
            } else {
                for i in n..<arr.count {
                    arr.swapAt(i, n)
                    permutation(input: arr, n: n + 1)
                    arr.swapAt(i, n)
                }
            }
        }
        permutation(input: input, n: n)
        return list
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////
    // kakao coding test
    ////////////////////////////////////////////////////////////////////////////////
    /*
     정수 a 와 정수 b 가 같아지는 조합의 순번을 찾아라
     */
    func findSimilar(a: Int, b: Int) -> Int {
        var intAList = Array(String(a)).compactMap { Int(String($0)) }
        let intBList = Array(String(b)).compactMap { Int(String($0)) }
        print(intAList)
        print(intBList)
        var permutatedList = [[Int]]()
        var count = 0, indexOfMatched = 0
        func permutate(arr: [Int], n: Int, targetList: [Int], cargo: inout [[Int]], matchedIndex: inout Int) {
            if n == 0 {
                print("permuation[\(count)]: \n \(arr), \(targetList)")
                cargo.append(arr)
                var matchCount = 0
                for i in 0..<arr.count {
                    if arr[i] == targetList[i] {
                        print("arr[\(i)] == targetList[\(i)]  >> \(arr[i]) == \(targetList[i])")
                        matchCount += 1
                    }
                }
                if matchCount == targetList.count {
                    matchedIndex = cargo.count
                    print("matched:: \(matchedIndex), \(arr), \(targetList)")
                }
                print()
                count += 1
            } else {
                var list = arr
                permutate(arr: list, n: n - 1, targetList: targetList, cargo: &cargo, matchedIndex: &matchedIndex)
                for i in 0..<n {
                    list.swapAt(i, n)
                    permutate(arr: list, n: n - 1, targetList: targetList, cargo: &cargo, matchedIndex: &matchedIndex)
                    list.swapAt(i, n)
                }
            }
            count += 1
        }
        permutate(arr: intAList, n: intAList.count-1, targetList: intBList, cargo: &permutatedList, matchedIndex: &indexOfMatched)
        print("= permutatedList =")
        print(permutatedList)
        if indexOfMatched == 0 {
            return permutatedList.count
        }
        return indexOfMatched
    }
    
//    var num0 = 1234, num1 = 2341
//    var result = findSimilar(a: num0, b: num1)
//    print("result: \(result)")
//    num0 = 1234; num1 = 1213 // 실패
//    result = findSimilar(a: num0, b: num1)
//    print("result: \(result)")
//    num0 = 14567; num1 = 45617
//    result = findSimilar(a: num0, b: num1)
//    print("result: \(result)")
    
    
    func programmerStrings(s: String) -> Int {
        func containsProgrammer(s1: String) -> Bool {
            let programmer: String = "programmer"
            let sList1 = Array(s1)
            var matchCount = 0
            for i in 0..<sList1.count {
                if programmer.contains(sList1[i]) {
                    matchCount += 1
                }
            }
            return matchCount == programmer.count
        }
        var strings = Array(s)
        let center = (strings.count / 2)
        var leftSide = center - 1, rightSide = center
        if rightSide - leftSide > 1 {
            return 0
        }
        var findIndexPair = false
        while leftSide >= 0 && rightSide < strings.count {
            let str0 = String(strings[0...leftSide])
            let str1 = String(strings[rightSide..<strings.count])
            print("left: \(str0), right: \(str1)")
            if containsProgrammer(s1: str0) && containsProgrammer(s1: str1) {
                findIndexPair = true
                print("find!!! leftAnchor: \(leftSide), rightAnchor: \(rightSide)")
                break
            }
            leftSide -= 1
            rightSide += 1
        }
        
        return findIndexPair ? 2 : 0
    }
//    var string = "progxrammerrxproxgrammer"
//    var result = programmerStrings(s: string)
//    print("result: \(result)")
//    string = "xprogxrmaxemrppprmmograeiruu"
//    result = programmerStrings(s: string)
//    print("result: \(result)")
//    string = "programmerprogrammer"
//    result = programmerStrings(s: string)
//    print("result: \(result)")

    
    
        // timeout 으로 HackerRank 에서 코딩하다가 오타 잡으려고 xcode 로 옮겼는데 메모리가 모자라서인지 에러 하나도 못잡아주고 빌드 하다가 timeout 5초에 다시 HackerRank 로 코드 복사하고 0초 되는 순간 commit ㅡ,.ㅡ;;;
        // foo 함수 for loop 안에서 오타 및 타입 충돌 3~4개 ..... 문자열 자를 때 index + 1 해줘야 하는데 index 만 넣어서 문자열 조합 안만들어지는 코드가 commit ...
        func makeMap(isUppercase: Bool) -> [String : String] {
            let strs = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
            var startValue = isUppercase ? 65 : 97
//            let endValue = startValue + 25
            let whiteSpace = 32
            var mapped = [String: String]()
            for char in strs {
                mapped[String(startValue)] = isUppercase ? char.uppercased() : char
                startValue += 1
            }
            mapped[String(whiteSpace)] = " "
            return mapped
        }

        func foo(encoded: String) -> String {
            let lowerMap = makeMap(isUppercase: false)
            let upperMap = makeMap(isUppercase: true)

            var str = Array(encoded)
            let buffer = 3
            var decoded = ""
            while str.count >= 0 {
                var ascii = ""
                let end = str.count < buffer ? str.count : buffer
                for i in 0..<end {
                    ascii += String(str[i])
                    print("ascii: \(ascii)")
                    if lowerMap[ascii] != nil {
                        decoded += lowerMap[ascii]!
                        print("lower > decoded: \(decoded)")
                        str = Array(str[(i+1)..<str.count])
                        print("sliced: \(str)")
                        break
                    } else if upperMap[ascii] != nil {
                        decoded += upperMap[ascii]!
                        print("upper > decoded: \(decoded)")
                        str = Array(str[(i+1)..<str.count])
                        print("sliced: \(str)")
                        break
                    }
                }
            }
            return decoded
        }
//        print("decoded: \(foo(encoded: "9798993277"))")
    
    
    
}

