//
//  CustomPriorityQueue.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-18.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

public class CustomPriorityQueue<T> {
    private var arr: [T] = []
    private let compare: (_ a: T, _ b: T) -> Bool
    private let limit: Int

    init(_ limit: Int, _ compare: @escaping (_ a: T, _ b: T) -> Bool) {
        self.compare = compare
        self.limit = limit
    }

    func insert(_ a: T) {
        arr.insert(a, at: 0)
        heapify(0)
        if arr.count > self.limit {
            arr.removeLast()
        }
    }
    
    func peek() -> T? {
        if arr.isEmpty {
            return nil
        }
        
        return arr[0]
    }

    func pop() -> T? {
        if arr.isEmpty {
            return nil
        }

        let res: T = arr.removeFirst()

        if !arr.isEmpty {
            arr.insert(arr.removeLast(), at: 0)
            heapify(0)
        }

        return res
    }
    
    func describe() {
        print(arr)
    }

    private func heapify(_ i: Int) {
        let l: Int = 2 * i + 1, r: Int = 2 * i + 2
        var root: Int = i

        if l < arr.count, compare(arr[l], arr[root]) {
            root = l
        }

        if r < arr.count, compare(arr[r], arr[root]) {
            root = r
        }

        if root == i {
            return
        }

        let temp: T = arr[i]
        arr[i] = arr[root]
        arr[root] = temp

        heapify(root)
    }
}
