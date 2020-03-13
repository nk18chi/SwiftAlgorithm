//
//  MinimumCostFlow.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-10.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func minimumCostFlow() {
    struct Edge {
        let u: Int
        let v: Int
        let cost: Int
        let isActive: Bool
    }
    // create graph
    let firstList: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n: Int = firstList[0]
    let m: Int = firstList[1]
    let d: Int = firstList[2]
    var edges: [Edge] = []
    for i in 0..<m {
        let line: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
        let isActive: Bool = i < n - 1 ? true : false
        let e: Edge = Edge(u: line[0], v: line[1], cost: line[2], isActive: isActive)
        edges.append(e)
    }
    edges.sort { $0.cost < $1.cost }
    
    var uf = UF(n + 1)
    var days : Int = 0
    var i: Int = 0
    var c: Int = 0
    while i < m {
        guard c < n - 1 else { break }
        let e = edges[i]
        if !uf.connected(e.u, e.v) {
            uf.union(e.u, e.v)
            if !e.isActive { days += 1 }
            c += 1
        }
        i += 1
    }
    
    let max: Int = edges[i - 1].cost
    if !edges[i - 1].isActive {
        var uf2 = UF(n + 1)
        for e in edges {
            if uf2.connected(e.u, e.v) { continue }
            if e.cost < max || e.cost == max && e.isActive {
                uf2.union(e.u, e.v)
            } else if e.isActive && e.cost <= d {
                days -= 1
                break
            }
        }
    }
    
    print(days)
}



//public struct UF2 {
//    /// parent[i] = parent of i
//    public var parent: [Int]
//    /// size[i] = number of nodes in tree rooted at i
//    private var size: [Int]
//    /// number of components
//    private(set) var count: Int
//
//    /// Initializes an empty union-find data structure with **n** elements
//    /// **0** through **n-1**.
//    /// Initially, each elements is in its own set.
//    /// - Parameter n: the number of elements
//    public init(_ n: Int) {
//        self.count = n
//        self.size = [Int](repeating: 1, count: n)
//        self.parent = [Int](repeating: 0, count: n)
//        for i in 0..<n {
//            self.parent[i] = i
//        }
//    }
//
//    /// Returns the canonical element(root) of the set containing element `p`.
//    /// - Parameter p: an element
//    /// - Returns: the canonical element of the set containing `p`
//    public mutating func find(_ p: Int) -> Int {
//        var root: Int = p
//        while (root != parent[root]) {
//            parent[root] = parent[parent[root]]
//            root = parent[root]
//        }
//        return root
//    }
//
//    /// Returns `true` if the two elements are in the same set.
//    /// - Parameters:
//    ///   - p: one elememt
//    ///   - q: the other element
//    /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
//    public mutating func connected(_ p: Int, _ q: Int) -> Bool {
//        return find(p) == find(q)
//    }
//
//    /// Merges the set containing element `p` with the set containing
//    /// element `q`
//    /// - Parameters:
//    ///   - p: one element
//    ///   - q: the other element
//    public mutating func union(_ p: Int, _ q: Int) {
//        let pRoot: Int = find(p)
//        let qRoot: Int = find(q)
//        if (pRoot == qRoot) { return }
//        if (size[pRoot] < size[qRoot]) {
//            parent[pRoot] = qRoot
//            size[qRoot] += size[pRoot]
//        } else {
//            parent[qRoot] = pRoot
//            size[pRoot] += size[qRoot]
//        }
//        count -= 1
//    }
//}
//
