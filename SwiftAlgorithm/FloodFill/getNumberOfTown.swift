//
//  getNumberOfTown.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-27.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func getNumberOfTown() {
    // create input
    let n: Int = Int(readLine()!)!
    var array: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    for i in 0..<n {
        let row: String = readLine()!
        for j in 0..<row.count {
            array[i][j] = Int(row[j])!
        }
    }

    func dfs(row: Int, col: Int, visited: inout [[Int]]) -> Int {
        guard row > -1 && row < n else { return 0 }
        guard col > -1 && col < n else { return 0 }
        guard visited[row][col] == 1 else { return 0 }
        
        visited[row][col] = 0
        var sum = 1
        sum += dfs(row: row - 1, col: col, visited: &visited)
        sum += dfs(row: row, col: col + 1, visited: &visited)
        sum += dfs(row: row + 1, col: col, visited: &visited)
        sum += dfs(row: row, col: col - 1, visited: &visited)
        
        return sum
    }
    
    var res: [Int] = []
    for i in 0..<n {
        for j in 0..<n {
            if array[i][j] == 1 {
                res.append(dfs(row: i, col: j, visited: &array))
            }
        }
    }
    res.sort()
    print(res.count)
    for r in res {
        print(r)
    }
}
