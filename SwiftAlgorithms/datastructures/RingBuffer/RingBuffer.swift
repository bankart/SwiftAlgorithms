//
//  RingBuffer.swift
//  SwiftAlgorithms
//
//  Created by taehoon lee on 2018. 3. 2..
//  Copyright © 2018년 taehoon lee. All rights reserved.
//

import Foundation


public struct RingBuffer<T> {
    
    private var array: [T?]
    
    private var readIndex: Int = 0
    
    private var writeIndex: Int = 0
    
    private var availableSpaceToReading: Int {
        return writeIndex - readIndex
    }
    
    private var availableSpaceToWriting: Int {
        return array.count - availableSpaceToReading
    }
    
    private var isFull: Bool {
        return availableSpaceToWriting == 0
    }
    
    private var isEmpty: Bool {
        return availableSpaceToReading == 0
    }
    
    init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }
    
    @discardableResult
    public mutating func write(_ element: T) -> Bool {
        guard !isFull else {
            return false
        }
        defer {
            writeIndex += 1
        }
        array[wrapped: writeIndex] = element
        return true
    }
    
    public mutating func read() -> T? {
        guard !isEmpty else {
            return nil
        }
        defer {
            array[wrapped: readIndex] = nil
            readIndex += 1
        }
        return array[wrapped: readIndex]
    }
    
}

extension RingBuffer: Sequence {
    public func makeIterator() -> AnyIterator<T> {
       var index = readIndex
        return AnyIterator {
            guard index < self.writeIndex else {
                return nil
            }
            defer {
                index += 1
            }
            return self.array[wrapped: index]
        }
    }
}

private extension Array {
    subscript(wrapped index: Int) -> Element {
        get {
            return self[index % count]
        }
        set {
            self[index % count] = newValue
        }
    }
}
