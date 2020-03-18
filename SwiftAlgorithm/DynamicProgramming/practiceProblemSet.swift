//
//  practiceProblemSet1.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-17.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

// Problem 1 - Equal Subset Sub Partition
func equalSubsetSubPartitio(_ array: [Int]) -> Bool {
//    let input: String = readLine()!.replacingOccurrences(of: "\\{|\\}|,", with: "", options: .regularExpression)
//    let array: [Int] = input.split(separator: " ").compactMap { Int($0) }
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

// Problem 1 - Longest Palindrome Subsequences
func longestPalindromeSubsequence(_ input: String) -> Int {
//    let input: String = readLine()!.replacingOccurrences(of: "\"", with: "")
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


// Problem 1 - Longest Common Substring
func longestCommonSubstring(s1: String, s2: String) -> Int {
    var patterns: Set<String> = []
    var prev: Set<String> = []
    for c in s1 {
        for p in prev {
            let newWord: String = p + String(c)
            patterns.insert(newWord)
            prev.insert(newWord)
            prev.remove(p)
        }
        patterns.insert(String(c))
        prev.insert(String(c))
    }
    
    prev = []
    var res: Int = 0
    for c in s2 {
        for p in prev {
            let newWord: String = p + String(c)
            if patterns.contains(newWord) { res = max(res, newWord.count) }
            prev.insert(newWord)
            prev.remove(p)
        }
        if patterns.contains(String(c)) { res = max(res, 1) }
        prev.insert(String(c))
    }

    return res
}
