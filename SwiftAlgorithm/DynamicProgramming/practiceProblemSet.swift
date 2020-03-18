//
//  practiceProblemSet1.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-17.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

// Problem 1 - Equal Subset Sub Partition
func equalSubsetSubPartitio() -> Bool {
    let input: String = readLine()!.replacingOccurrences(of: "\\{|\\}|,", with: "", options: .regularExpression)
    let array: [Int] = input.split(separator: " ").compactMap { Int($0) }
    let sum: Int = array.reduce(0, +)
    
    if sum % 2 == 1 { return false }
    let target: Int = sum / 2
    var dp: Set<Int> = []
    for i in 0..<array.count {
        if array[i] == target { return true }
        for n in dp {
            if n + array[i] == target { return true }
            dp.insert(n + array[i])
        }
        dp.insert(array[i])
    }
    
    return false
}

// Problem 1 - Longest Palindrome Subsequence
func longestPalindromeSubsequence() -> Int {
    let input: String = readLine()!.replacingOccurrences(of: "\"", with: "")
    if input.count < 2 { return input.count}
    
    var set: Set<String> = []
    for i in 0..<input.count {
        for s in set {
            set.insert(s + input[i])
        }
        set.insert(input[i])
    }
    
    var longestVal: Int = 1
    let setArray: [String] = set.sorted { $0.count > $1.count }
    for s in setArray {
        if s.count < 2 { break }
        if s == String(s.reversed()) {
            longestVal = s.count
            break
        }
    }

    return longestVal
}

