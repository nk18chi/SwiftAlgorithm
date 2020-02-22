//
//  longestDiameter.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-21.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func getLongestDiameter() {
    // get input
    var dict: [Int:[[Int]]] = [:]
    let row = Int(readLine()!)!
    for _ in 0..<row {
        let splited = readLine()!.split(separator: " ")
        let key = Int(splited[0])!
        dict[key] = []
        var i: Int = 1
        while(i < splited.count - 1) {
            dict[key]!.append([Int(splited[i])!, Int(splited[i+1])!])
            i += 2
        }
    }
    
    var answer: Int = 0
    // recursion
    func helper(target: Int, add: Int, sum: Int, seen: Set<Int>) {
        guard !seen.contains(target) else { return }
        var newSeen = seen
        newSeen.insert(target)
        for array in dict[target]! {
            helper(target: array[0], add: array[1], sum: sum + add, seen: newSeen)
        }
        answer = max(answer, sum + add)
    }

    for (key, value) in dict {
        for v in value {
            var seen: Set<Int> = []
            seen.insert(key)
            helper(target: v[0], add: v[1], sum: 0, seen: seen)
        }
    }
    print(answer)
}
