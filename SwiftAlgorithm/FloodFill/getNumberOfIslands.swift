//
//  getNumberOfIslands.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-27.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation


func getNumberOfIslands() {
    // create input
    let firstLine: [Substring] = readLine()!.split(separator: " ")
    let w: Int = Int(firstLine[0])!
    let h: Int = Int(firstLine[1])!
    
    var array: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: w), count: h)
    for i in 0..<h {
        let row: [Substring] = readLine()!.split(separator: " ")
        for j in 0..<w {
            array[i][j] = Int(row[j])!
        }
    }
    
    func dfs(row: Int, col: Int, visited: inout [[Int]]) -> Int {
        guard row > -1 && row < h else { return 0 }
        guard col > -1 && col < w else { return 0 }
        guard visited[row][col] == 1 else { return 0 }
        
        visited[row][col] = 0
        var sum = 1
        sum += dfs(row: row - 1, col: col, visited: &visited) // upper
        sum += dfs(row: row - 1, col: col + 1, visited: &visited) // upper right
        sum += dfs(row: row, col: col + 1, visited: &visited) // right
        sum += dfs(row: row + 1, col: col + 1, visited: &visited) // bottom right
        sum += dfs(row: row + 1, col: col, visited: &visited) // bottom
        sum += dfs(row: row + 1, col: col - 1, visited: &visited) // bottom left
        sum += dfs(row: row, col: col - 1, visited: &visited) // left
        sum += dfs(row: row + 1, col: col - 1, visited: &visited) // upper left
        
        return sum
    }
    
    var res: [Int] = []
    for i in 0..<h {
        for j in 0..<w {
            if array[i][j] == 1 {
                res.append(dfs(row: i, col: j, visited: &array))
            }
        }
    }
    print(res.count)
}
