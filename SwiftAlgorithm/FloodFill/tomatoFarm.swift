//
//  tomatoFarm.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-27.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

// 0 day
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1

// 1 day
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1
//0 0 0 0 1 1

// 2 day
//0 0 0 0 0 0
//0 0 0 0 0 1
//0 0 0 0 1 1
//0 0 0 1 1 1

// 3 day
//0 0 0 0 0 1
//0 0 0 0 1 1
//0 0 0 1 1 1
//0 0 1 1 1 1

// 4 day
//0 0 0 0 1 1
//0 0 0 1 1 1
//0 0 1 1 1 1
//0 1 1 1 1 1

// 5 day
//0 0 0 1 1 1
//0 0 1 1 1 1
//0 1 1 1 1 1
//1 1 1 1 1 1

// 6 day
//0 0 1 1 1 1
//0 1 1 1 1 1
//1 1 1 1 1 1
//1 1 1 1 1 1

// 7 day
//0 1 1 1 1 1
//1 1 1 1 1 1
//1 1 1 1 1 1
//1 1 1 1 1 1

// 8 day
//1 1 1 1 1 1
//1 1 1 1 1 1
//1 1 1 1 1 1
//1 1 1 1 1 1

func tomatoFarm() {
    // create array from input
    let firstLine: [Substring] = readLine()!.split(separator: " ")
    let w: Int = Int(firstLine[0])!
    let h: Int = Int(firstLine[1])!
    var total: Int = 0

    var array: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: w), count: h)
    var startArray: [[Int]] = []
    for i in 0..<h {
        let row: [Substring] = readLine()!.split(separator: " ")
        for j in 0..<w {
            array[i][j] = Int(row[j])!
            if array[i][j] > -1 {
                total += 1
            }
            if array[i][j] == 1 {
                startArray.append([i, j])
            }
        }
    }
    
    func helper(row: Int, col: Int, array: inout [[Int]]) -> Int {
        guard row > -1 && row < h else { return 0 }
        guard col > -1 && col < w else { return 0 }
        guard array[row][col] == 0 else { return 0 }
        array[row][col] = 1
        return 1
    }
    
    var days: Int = 0
    func bfs(points: [[Int]], array: [[Int]]) -> Int {
        let totalArray: [Int] = array.flatMap {$0.filter {$0 > 0}}
        if totalArray.reduce(0, +) == total {
            return days
        }

        var next: [[Int]] = []
        var newArray: [[Int]] = array
        for p in points {
            if helper(row: p[0] - 1, col: p[1], array: &newArray) > 0 {
                next.append([p[0] - 1, p[1]])
            }
            if helper(row: p[0], col: p[1] + 1, array: &newArray) > 0 {
                next.append([p[0], p[1] + 1])
            }
            if helper(row: p[0] + 1, col: p[1], array: &newArray) > 0 {
                next.append([p[0] + 1, p[1]])
            }
            if helper(row: p[0], col: p[1] - 1, array: &newArray) > 0 {
                next.append([p[0], p[1] - 1])
            }
        }
        if next.count < 1 { return -1 }
        days += 1
        return bfs(points: next, array: newArray)
    }
    print(bfs(points: startArray, array: array))
}
