//
//  bridges.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-27.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

// expand each island
// if a number is firstly ovverraped, the number must be shortest

//1 1 1 0 0 0 0 1 1 1
//1 1 1 1 0 0 0 0 1 1
//1 0 1 1 0 0 0 0 1 1
//0 0 1 1 1 0 0 0 0 1
//0 0 0 1 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 1 1 0 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 0 0 0 0 0 0

//. . . 2 0 0 2 . . .
//. . . . 2 0 0 2 . .
//. 2 . . 2 0 0 2 . .
//2 2 . . . 2 0 0 2 .
//0 0 2 . 2 0 0 0 2 .
//0 0 0 2 0 0 0 0 2 .
//0 0 0 0 2 2 0 0 0 2
//0 0 0 2 . . 2 0 0 0
//0 0 0 2 . . . 2 0 0
//0 0 0 0 2 2 2 0 0 0

//. . . . 3 3 . . . .
//. . . . . 3 3 . . .
//. . . . . 3 3 . . .
//. . . . . . 3 3 . .
//3 3 . . . 3 0 3 . .
//0 0 3 . 3 3 0 3 . .
//0 0 0 3 . . 3 0 3 . // [6][3] is overraped
//0 0 3 . . . . 3 0 3
//0 0 3 . . . . . 3 0
//0 0 0 3 . . . 3 0 0






func bridges() {
    // create array from input
    let n: Int = Int(readLine()!)!
    var map: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    for i in 0..<n {
        let row: [Substring] = readLine()!.split(separator: " ")
        for j in 0..<n {
            map[i][j] = Int(row[j])!
        }
    }
    
    func dfs(row: Int, col: Int, next: inout Set<[Int]>) {
        guard row > -1 && row < n else { return }
        guard col > -1 && col < n else { return }
        guard map[row][col] > -1 else { return }
        guard map[row][col] != 0 else {
            next.insert([row, col])
            return
        }
        map[row][col] = -1
        let array: [[Int]] = [[-1, 0], [0, 1], [1, 0], [0, -1]]
        for a in array {
            dfs(row: row + a[0], col: col + a[1], next: &next)
        }
    }
    
    
    var nexts: [Set<[Int]>] = []
    for i in 0..<n {
        for j in 0..<n {
            if map[i][j] == 1 {
                var next: Set<[Int]> = []
                dfs(row: i, col: j, next: &next)
                nexts.append(next)
            }
        }
    }
    
    // find edge
    func canExpand(row: Int, col: Int) -> [Int]? {
        guard row > -1 && row < n else { return nil }
        guard col > -1 && col < n else { return nil }
        guard map[row][col] == 0 else { return nil }
        return [row, col]
    }
    
    func helper(changes: [Set<[Int]>], num: Int) -> Int {
        var nexts: [Set<[Int]>] = []
        for change in changes {
            var visited: Set<[Int]> = []
            for c in change {
                if map[c[0]][c[1]] > 0 {
                    return map[c[0]][c[1]] + num - 1
                }
                map[c[0]][c[1]] = num
                let array: [[Int]] = [[-1, 0], [0, 1], [1, 0], [0, -1]]
                for a in array {
                    if let next: [Int] = canExpand(row: c[0] + a[0], col: c[1] + a[1]) {
                        if change.contains(next) { continue }
                        visited.insert(next)
                    }
                }
            }
            nexts.append(visited)
        }
        return helper(changes: nexts, num: num + 1)
    }
    print(helper(changes: nexts, num: 1))
}
