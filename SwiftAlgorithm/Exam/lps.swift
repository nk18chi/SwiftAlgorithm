//
//  lps.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-20.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation


// Problem 1: Palindrome Length (lps.swift) - 30 points
func lps() -> Int {
    let input: String = readLine()!
    let n: Int = input.count
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var res: Int = 0
    for i in stride(from: n - 1, through: 0, by: -1) {
        for j in i..<n {
            if i == j {
                dp[i][j] = 1
                continue
            }
            if input[i] == input[j] {
                dp[i][j] = j - i == 1 || dp[i+1][j-1] > 0 ? 2 + dp[i+1][j-1] : 0
                res = max(res, dp[i][j])
            } else {
                dp[i][j] = 0
            }
        }
    }
    return res
}
