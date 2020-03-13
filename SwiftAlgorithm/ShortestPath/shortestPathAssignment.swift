//
//  shortestPathAssignment.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-12.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

// 743. Network Delay Time
// https://leetcode.com/problems/network-delay-time/
// Runtime: 520 ms, faster than 81.63% of Swift online submissions for Network Delay Time.
// Memory Usage: 21.2 MB, less than 100.00% of Swift online submissions for Network Delay Time.
func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
    struct Edge {
        let to: Int
        let cost: Int
    }
    var check: [Int] = [Int](repeating: 1, count: N + 1)
    var dist: [Int] = [Int](repeating: Int.max, count: N + 1)
    var adj: [[Edge]] = [[Edge]](repeating: [], count: N + 1)
    
    for time in times {
        let from: Int = time[0]
        adj[from].append(Edge(to: time[1], cost: time[2]))
    }
    dist[0] = 0
    check[0] = 0
    
    dist[K] = 0
    check[K] = 0
    let q = Queue<Int>()
    q.enqueue(item: K)
    while !q.isEmpty() {
        let cur: Int = q.dequeue()!
        for e in adj[cur] {
            let v = e.to
            if dist[v] > dist[cur] + e.cost {
                dist[v] = dist[cur] + e.cost
                q.enqueue(item: v)
                check[v] = 0
            }
        }
    }
    
    if check.reduce(0, +) > 0 { return -1 }
    return dist.max()!
}

// 787. Cheapest Flights Within K Stops
// https://leetcode.com/problems/cheapest-flights-within-k-stops/
// first solution
// Runtime: 2820 ms, faster than 6.67% of Swift online submissions for Cheapest Flights Within K Stops.
// Memory Usage: 20.9 MB, less than 100.00% of Swift online submissions for Cheapest Flights Within K Stops.
//func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
//    var graph: [[[Int]]] = [[[Int]]](repeating: [], count: n)
//    var check: [Bool] = [Bool](repeating: false, count: n)
//    for f in flights {
//        let g: [Int] = [f[1], f[2]]
//        graph[f[0]].append(g)
//    }
//
//    var min: Int = Int.max
//    func dfs(from: Int, to: Int, k: Int, cost: Int) {
//        if cost > min { return }
//        if check[from] { return }
//        if k < 0 { return }
//        if from == to {
//            if min > cost {
//                min = cost
//            }
//            return
//        }
//        for next in graph[from] {
//            let tmp: Bool = check[next[0]]
//            dfs(from: next[0], to: to, k: k - 1, cost: cost + next[1])
//            check[next[0]] = tmp
//        }
//        check[from] = true
//    }
//
//    dfs(from: src, to: dst, k: K + 1, cost: 0)
//    return min == Int.max ? -1 : min
//}

// second solution
// Runtime: 80 ms, faster than 96.67% of Swift online submissions for Cheapest Flights Within K Stops.
// Memory Usage: 20.9 MB, less than 100.00% of Swift online submissions for Cheapest Flights Within K Stops.
func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
    var prices: [Int] = [Int](repeating: Int.max, count: n)
    var graph: [[[Int]]] = [[[Int]]](repeating: [], count: n)
    for f in flights {
        let g: [Int] = [f[1], f[2]]
        graph[f[0]].append(g)
    }
    
    let q = Queue<[Int]>()
    q.enqueue(item: [src, 0, K + 1])
    while !q.isEmpty() {
        let cur: [Int] = q.dequeue()!
        if cur[2] < 0 { continue }
        if prices[cur[0]] > cur[1] {
            prices[cur[0]] = cur[1]
            for g in graph[cur[0]] {
                q.enqueue(item: [g[0], g[1] + cur[1], cur[2] - 1])
            }
        }
    }
    
    print(prices[dst])
    return prices[dst] == Int.max ? -1 : prices[dst]
}

