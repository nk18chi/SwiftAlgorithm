//
//  dpAssignment.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-12.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

// 6. Pretty Number
func prettyNumber() {
    let n: Int = Int(readLine()!)!
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n)
    for i in 1...9 {
        dp[0][i] = 1
    }
    for i in 1..<n {
        dp[i][0] += dp[i-1][1]
        for j in 1...8 {
            dp[i][j] += dp[i-1][j-1]
            dp[i][j] += dp[i-1][j+1]
        }
        dp[i][9] += dp[i-1][8]
    }
    let sum = dp[n-1].reduce(0, +)
    print(sum)
}

// 7. Non-decreasing Digits
func nonDecreasingDigits() {
    let n: Int = Int(readLine()!)!
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 1, count: 10), count: n)
    for i in 1..<n {
        for j in stride(from: 8, through: 0, by: -1) {
            dp[i][j] = dp[i][j+1] + dp[i-1][j]
        }
    }
    print(dp[n-1].reduce(0, +))
}

// 8. Longest Increasing Subsequence
// https://leetcode.com/problems/longest-increasing-subsequence/submissions/
// Runtime: 88 ms, faster than 72.09% of Swift online submissions for Longest Increasing Subsequence.
// Memory Usage: 20.9 MB, less than 33.33% of Swift online submissions for Longest Increasing Subsequence.
func lengthOfLIS(_ nums: [Int]) -> Int {
    if nums.count == 0 { return 0 }
    var dp: [Int] = [Int](repeating: 0, count: nums.count)
    dp[0] = 1
    for i in 1..<nums.count {
        var maxVal: Int = 0
        for j in 0..<i {
            if nums[j] < nums[i] && maxVal < dp[j] {
                maxVal = dp[j]
            }
        }
        dp[i] = maxVal + 1
    }
    return dp.max()!
}
