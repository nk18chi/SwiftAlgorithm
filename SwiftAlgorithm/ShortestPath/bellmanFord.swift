//
//  bellmanFord.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-10.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

struct Edge {
    let to: Int
    let from: Int
    let cost: Int
}

// Time complexity O(VE)
func hellmanFord(_ edges:[Edge], _ n: Int, _ source: Int) {
    var dist = [Int](repeating: Int.max, count: n + 1)
    dist[source] = 0
    for _ in 0..<n - 1 {
        for edge in edges {
            let from = edge.from
            let to = edge.to
            let cost = edge.cost
            if dist[to] > dist[from] + cost {
                dist[to] = dist[from] + cost
            }
        }
    }
    print(dist)
}

// Time complexity O(E) - average
func shortestPathFasterAlgorithm(_ adj:[[Edge]], _ n: Int, _ source: Int) {
    let q = Queue<Int>()
    var check = [Bool](repeating: false, count: n + 1)
    var dist = [Int](repeating: Int.max, count: n + 1)
    
    q.enqueue(item: source)
    dist[source] = 0
    check[source] = true
    while !q.isEmpty() {
        let from = q.dequeue()!
        check[from] = false
        for edge in adj[from] {
            let cost = edge.cost
            let to = edge.to
            if dist[to] > dist[from] + cost {
               dist[to] = dist[from] + cost
                if !check[to] {
                    q.enqueue(item: to)
                    check[to] = true
                }
            }
        }
    }
}
