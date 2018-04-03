//
//  AppDelegate.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 2. 28..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//
/*
 아래의 내용 반복 숙달할것!!!!
 [ 필수 자료구조 및 알고리즘과 개념]
 LinkedList:              Breadth-First Search,     Bit Manipulation
 Tree, Tries, Graph:      Depth-First Search,       Stack vs Heap
 Stack, Queue:            Binary Search,            Recursive
 Heap:                    Merge Sort,               Dynamic Programming
 Array:                   Quick Sort,               Big-O
 Hash Table
 
 
 [ 2의 승수(power of 2) 표 ]
 암기해 두면 유용함
 x      2^x             근사치                     메모리 요구량
 7      128
 8      256
 10     2014            1,000(천)                1k
 20     1,048,576       1,000,000(백만)           1MB
 30     1,073,741,824   1,000,000,000(십억)       1GB
 
 [ Dominance Ranking ]
 Big-O 시간 복잡도 순서
 n! > c^n > n^3 > n^2 > nlogn > n > sqrt(n) > log^2n > logn > logn/loglogn > loglogn > n > 1
 참고링크: https://github.com/raywenderlich/swift-algorithm-club/blob/master/Big-O%20Notation.markdown
 
 */
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

