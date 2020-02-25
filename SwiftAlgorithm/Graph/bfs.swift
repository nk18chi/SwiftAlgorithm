//
//  bfs.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-24.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func storeAjancency() {
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
    
    //BFS
    var visited: [Bool] = [Bool](repeating: false, count: n + 1)
    let queue = Queue<Int>()
    queue.enqueue(item: 1)
    visited[1] = true
    
    while !queue.isEmpty() {
        let first = queue.dequeue()!
        for v in adjList[first] {
            if !visited[v] {
                queue.enqueue(item: v)
                visited[v] = true
            }
        }
    }
}
