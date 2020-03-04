//
//  TopologicalSort.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 3/3/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

func TopologicalSort() {
    let firstline = readLine()!
                        .split(separator: " ")
                        .map { Int($0)! }

    let N = firstline[0]
    let M = firstline[1]
    
    var adj = [[Int]](repeating: [Int](), count: N + 1)
    var indegree = [Int](repeating: 0, count: N + 1)
    
    for _ in 0..<M { // M edges
        let edge = readLine()!
                        .split(separator: " ")
                        .map { Int($0)! }
        let u = edge[0]
        let v = edge[1]
        adj[u].append(v)
        indegree[v] += 1
    }
    
    // topological sort
    let q = Queue<Int>()
    // initial state
    for v in 1...N {
        if indegree[v] == 0 {
            q.enqueue(item: v)
        }
    }
    // BFS
    while !q.isEmpty() {
        let x = q.dequeue()!
        print(x) // process
        for v in adj[x] {
            indegree[v] -= 1 // decrement indegree
            if indegree[v] == 0 {
                q.enqueue(item: v)
            }
        }
    }
}
