//
//  SampleForShare.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 3. 17..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//
//
//

import Foundation


/// 재처리 상황을 출력하고 결과물을 반환하는 클로져
typealias Reprocessing = (String) -> Compost

/// 이름을 가질 수 있는 대표 타입 선언
protocol Named {
    var name: String {get set}
    var alias: String? {get set}
}

/// 생물을 대표하는 대표 타입 선언
protocol Bio: CustomStringConvertible {
}
/// CustomStringConvertible 준수를 위한 초기구현
/// Bio 에 대한 description 을 반환할 수 있도록 허당으로 구현한다.
extension Bio {
    var description: String {
        return ""
    }
}

/// 생물에서 사용되는 원소 타입 선언
enum Elements: String, Bio {
    case oxygen, carbonDeoxide
    case unknown
    var description: String {
        return self.rawValue
    }
}

/// 생물의 생리 활동에 필요한 요소 타입 선언
enum OrganicMatter: String, Bio {
    case food, poop
    var description: String {
        return self.rawValue
    }
}

/// 생물의 생리 활동의 재처리 결과물 타입 선언
struct Compost: Bio, CustomStringConvertible {
    var base = [Bio]()
    var description: String {
        var desc = "<Compost>"
        for i in 0..<base.count {
            desc += "base[\(i)] = \(base[i])"
        }
        return desc
    }
}

/// 생물의 기본 특징을 가지는 타입 선언
protocol Organism {
    func breath(_ el: Bio) -> Bio
    func eat(_ matter: Bio) -> Reprocessing
}
/// Organism 의 초기 구현
extension Organism {
    
    /// 생물이 산소를 들이마시고 이산화탄소를 배출하는 행위를 표현한 함수
    ///
    /// - Parameter el: Bio 를 준수하는 Elements 타입으로 Elements.oxygen
    /// - Returns: Bio 를 준수하는 Elements 타입으로 기본적으로 Elements.carbonDeoxide
    func breath(_ el: Bio) -> Bio {
        if var element = el as? Elements {
            switch element {
            case .oxygen:           element = .carbonDeoxide
            case .carbonDeoxide:    element = .oxygen
            case .unknown:          element = .unknown
            }
            return element
        } else {
            return el
        }
    }
    
    /// 생물이 에너지원을 섭취하고 배설하는 행위를 표현한 함수
    ///
    /// - Parameter matter: Bio 를 준수하는 OrganicMatter 타입으로 OrganicMatter.food
    /// - Returns: Reprocessing 클로져 반환. 클로져 내부에서 Bio 를 준수하는 Compost 의 인스턴스가 반환됨
    func eat(_ matter: Bio) -> Reprocessing {
        if var element = matter as? OrganicMatter {
            switch element {
            case .food: element = .poop
            case .poop: element = .food
            }
            return {
                print((element as OrganicMatter).rawValue + " " + $0)
                return Compost(base: [element])
            }
        } else {
            return {
                print("fail: " + (matter as! OrganicMatter).rawValue + " " + $0)
                return Compost(base: [matter])
            }
        }
    }
}


/// 물질의 기본 특징을 가지는 타입 선언
protocol Substance {
    var isManufactured: Bool {get}
    var isMicroscopnic: Bool {get}
}

/// 이름을 가질 수 있고, 생물의 기본 특성을 가진 Person 타입
struct Person: Named, Organism {
    var name: String
    var alias: String?
    init(name: String) {
        self.name = name
    }
    
    init(name: String, alias: String? = nil) {
        self.name = name
        self.alias = alias
    }
}

/// 이름을 가질 수 있고, 물질의 특성을 가진 Things 타입
struct Things: Named, Substance {
    var name: String
    var alias: String?
    var isManufactured: Bool {
        return true
    }
    var isMicroscopnic: Bool {
        return false
    }
}

func makeSome() {
    var person = Person(name: "Me")
    print("name: \(person.name), alias: \(person.alias ?? "have no alias")")
    person.alias = "Master of Me"
    var effluent = person.breath(Elements.oxygen)
    print("after breath: \(effluent)")
    effluent = person.eat(OrganicMatter.food)("is reprocessed")
    print("after eat: \(effluent)")
    
    let stoneAxe = Things(name: "Stone Axe", alias: "kwang!kwang!")
    print("stoneAxe: \(stoneAxe.name), alias: \(stoneAxe.alias!)")
    print("isManufatured: \(stoneAxe.isManufactured), isMicroscopic: \(stoneAxe.isMicroscopnic)")
}

