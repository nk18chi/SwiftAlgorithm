//
//  getStepsToEscapeFromMaze.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-27.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func getStepsToEscapeFromMaze() {
    // create input
    let firstLine: [Substring] = readLine()!.split(separator: " ")
    let h: Int = Int(firstLine[0])!
    let w: Int = Int(firstLine[1])!
    
    var array: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: w), count: h)
    for i in 0..<h {
        let row: String = readLine()!
        for j in 0..<w {
            array[i][j] = Int(row[j])!
        }
    }
    
    func dfs(row: Int, col: Int, visited: [[Int]], count: Int) -> Int {
        guard row > -1 && row < h else { return 0 }
        guard col > -1 && col < w else { return 0 }
        guard visited[row][col] == 1 else { return 0 }
        if row == h - 1 && col == w - 1 { return count }
        
        var newVisited = visited
        newVisited[row][col] = 0
        var res: [Int] = []
        res.append(dfs(row: row - 1, col: col, visited: newVisited, count: count + 1))
        res.append(dfs(row: row, col: col + 1, visited: newVisited, count: count + 1))
        res.append(dfs(row: row + 1, col: col, visited: newVisited, count: count + 1))
        res.append(dfs(row: row, col: col - 1, visited: newVisited, count: count + 1))
        
        res = res.filter { $0 > 0 }
        if res.count < 1 {
            return 0
        }
        return res.min()!
    }
    
    print(dfs(row: 0, col: 0, visited: array, count: 1))
}
