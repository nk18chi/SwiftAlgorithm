//
//  prettyNumber.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-11.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func _prettyNumber() {
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

