//
//  dfs.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-25.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func dfsExersize1() {
    let firstLine = readLine()!.split(separator: " ")
    let n: Int = Int(firstLine[0])!
    let m: Int = Int(firstLine[1])!
    
    var adjList = [[Int]](repeating: [], count: n + 1)
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v)
        adjList[v].append(u)
    }
    
    func dfs1(num: Int, seen: inout [Bool]) {
        guard seen[num] == false else { return }
        seen[num] = true
        for j in adjList[num] {
            dfs1(num: j, seen: &seen)
        }
    }
    
    var count: Int = 0
    var seen: [Bool] = [Bool](repeating: false, count: n + 1)
    for i in 1..<n {
        if seen[i] == true { continue }
        dfs1(num: i, seen: &seen)
        count += 1
    }
    print(count)
}


var isBia = true
func dfsExersize2() {
    func dfs2(n: Int, adjList: inout [[Int]], checked: inout [Int], pattern: Int) {
        guard isBia == true else { return }
        if checked[n] != 0 {
            if checked[n] != pattern {
                isBia = false
            }
            return
        }
        checked[n] = pattern
        for i in adjList[n] {
            let opposite = pattern == 1 ? 2 : 1
            dfs2(n: i, adjList: &adjList, checked: &checked, pattern: opposite)
        }
    }
    
    let countTestCase = Int(readLine()!)!
    for _ in 0..<countTestCase {
        let firstLine = readLine()!.split(separator: " ")
        let n: Int = Int(firstLine[0])!
        let m: Int = Int(firstLine[1])!
        
        var adjList = [[Int]](repeating: [], count: n + 1)
        for _ in 0..<m {
            let edge = readLine()!.split(separator: " ")
            let u = Int(edge[0])!
            let v = Int(edge[1])!
            adjList[u].append(v)
            adjList[v].append(u)
        }
        var checked: [Int] = [Int](repeating: 0, count: n + 1)
        isBia = true
        dfs2(n: 1, adjList: &adjList, checked: &checked, pattern: 1)
        print(isBia)
    }
}


