//
//  dpAssignment.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-12.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

// 1. Climbing Stairs
// Runtime: 0 ms, faster than 100.00% of Swift online submissions for Climbing Stairs.
// Memory Usage: 20.8 MB, less than 20.00% of Swift online submissions for Climbing Stairs.
func climbStairs(_ n: Int) -> Int {
    if n < 4 { return n }
    var res: [Int] = [2, 3]
    for _ in 4..<n {
        let prev: Int = res.removeFirst()
        res.append(res[0] + prev)
    }
    return res[0] + res[1]
}

// 2. Make One
func makeOne(_ n: Int) -> Int {
    var dp: [Int] = [Int](repeating: 0, count: n + 1)
    dp[1] = 0
    for i in 2...n {
        var list: [Int] = [1, 1, 1]
        list[0] += dp[i-1]
        list[1] += i % 2 == 0 ? dp[i/2] : Int.max - 1
        list[2] += i % 3 == 0 ? dp[i/3] : Int.max - 1
        dp[i] = list.min()!
    }
    return dp[n]
}

// 3. 2 x N tiles
func two_nTiles(_ n: Int) -> Int {
    var dp: [Int] = [Int](repeating: 0, count: n + 1)
    dp[1] = 1
    dp[2] = 2
    for i in 3...n {
        dp[i] = dp[i-1] + dp[i-2]
    }
    return dp[n]
}

// 4. 2 x N tiles - 2
func two_nTiles_2(_ n: Int) -> Int {
    var dp: [Int] = [Int](repeating: 0, count: n + 1)
    dp[1] = 1
    dp[2] = 3
    for i in 3...n {
        dp[i] = dp[i-1] + dp[i-2] * 2
    }
    return dp[n]
}

// 5. One Two Three
func oneTwoThree() {
    func run(_ n: Int) {
        var dp: [Int] = [Int](repeating: 0, count: n + 1)
        dp[1] = 1
        dp[2] = 2
        dp[3] = 4
        for i in 4...n {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
        }
        print(dp[n])
    }
    
    let tests: Int = Int(readLine()!)!
    for _ in 0..<tests {
        let n: Int = Int(readLine()!)!
        run(n)
    }
}

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

// 9. Sum of Square numbers
// https://leetcode.com/problems/sum-of-square-numbers/
// Runtime: 8 ms, faster than 76.92% of Swift online submissions for Sum of Square Numbers.
// Memory Usage: 20.7 MB, less than 100.00% of Swift online submissions for Sum of Square Numbers.
func judgeSquareSum(_ c: Int) -> Bool {
    var lft: Int = 0
    var rgt: Int = Int(sqrt(Double(c)))
    
    while lft <= rgt {
        let res: Int = lft * lft + rgt * rgt
        if res == c { return true }
        if res < c { lft += 1 }
        else { rgt -= 1 }
    }
    
    return false
}

// 10. Sum of Square numbers - 2
func judgeSquareSum2(_ c: Int) -> Int {
    var dp: [Int] = [Int](repeating: 0, count: c + 1)
    dp[1] = 1
    for i in 2...c {
        let root: Int = Int(sqrt(Double(i)))
        var list: [Int] = [Int](repeating: Int.max, count: root + 1)
        for j in 1...root {
            let v: Int = i - j * j
            list[j] = dp[v] + 1
        }
        dp[i] = list.min()!
    }
    return dp[c]
}

// 11. Pokemon
func getMaxinumCandies() -> Int {
    let input: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n: Int = input[0]
    let m: Int = input[1]
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    
    for i in 0..<n {
        let squares = readLine()!.split(separator: " ").compactMap { Int($0) }
        for j in 0..<m {
            let up: Int = i == 0 ? Int.min : dp[i-1][j]
            let left: Int = j == 0 ? Int.min : dp[i][j-1]
            let maxVal: Int = max(up, left) == Int.min ? 0 : max(up, left)
            dp[i][j] = maxVal + squares[j]
        }
    }
    
    return dp[n-1][m-1]
}

// 12. Decode Ways
// Runtime: 8 ms, faster than 87.22% of Swift online submissions for Decode Ways.
// Memory Usage: 21.2 MB, less than 100.00% of Swift online submissions for Decode Ways.
func numDecodings(_ s: String) -> Int {
    let s = Array(s)
    var dp: [Int] = [Int](repeating: 0, count: s.count)
    if s[0] == "0" { return 0 }
    dp[0] = 1
    for i in 1..<s.count {
        dp[i] += dp[i-1]
        let prev: Int = Int(String(s[i-1]))!
        let cur: Int = Int(String(s[i]))!
        if cur == 0 {
            if prev == 1 || prev == 2 {
                dp[i] = i - 2 < 0 ? 1 : dp[i-2]
                continue
            }
            return 0
        }
        if prev == 1 || prev == 2 && cur < 7 {
            dp[i] += i - 2 < 0 ? 1 : dp[i-2]
        }
    }
    
    return dp[s.count - 1]
}

// 13. Maximum Subarray
// Runtime: 32 ms, faster than 99.66% of Swift online submissions for Maximum Subarray.
// Memory Usage: 21.3 MB, less than 16.67% of Swift online submissions for Maximum Subarray.
func maxSubArray(_ nums: [Int]) -> Int {
    var dp: Int = nums[0]
    var maxVal: Int = nums[0]
    for i in 1..<nums.count {
        dp = nums[i] > dp + nums[i] ? nums[i] : dp + nums[i]
        maxVal = max(maxVal, dp)
    }
    
    return maxVal
}


// 14. Edit Distance (optional)
// https://leetcode.com/problems/edit-distance/

// 15. Text Justification (optional)
// https://leetcode.com/problems/text-justification/
