//
//  dijkstra.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-09.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation


// 10 (N: the number of vertices)
// 9 (M: the number of edges)
// 1 2 3 (edge: u, v, weight)

// "Edge relaxation"
// dist: an array of elements representing distance(cost, weight, ...)
// For all edges (u, v)
// if dist[u] > dist[v] + w(u, v) {
//     dist[u] = dist[v] + w(u, v)
// }

// Time Complexity: O(v ^ 2)
// Space Complexity: Adancecy List - O(V + E)

func DiijkstraArray() {
    struct Edge {
        let to: Int
        let cost: Int
    }
    let n = Int(readLine()!)!
    var adj = [[Edge]](repeating: [], count: n + 1)
    var dist = [Int](repeating: Int.max, count: n + 1)
    var check = [Bool](repeating: false, count: n + 1)
    
    let m = Int(readLine()!)!
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
        let from = edge[0]
        adj[from].append(Edge(to: edge[1], cost: edge[2]))
    }
    
    // Dijkstra from source vertex 1
    dist[1] = 0

    for _ in 0..<n-1 {
      // the vertex of min value in dist
      var min = Int.max
      var u = 1
      for i in 1...n {
        if !check[i] && dist[i] < min {
          min = dist[i]
          u = i
        }
      }
      
      check[u] = true
      for edge in adj[u] {
        // relax edges
        let v = edge.to
        if dist[v] > dist[u] + edge.cost {
          dist[v] = dist[u] + edge.cost
        }
      }
    }
    // what is the shortest path to 5 from 1
    print(dist[5])
}
