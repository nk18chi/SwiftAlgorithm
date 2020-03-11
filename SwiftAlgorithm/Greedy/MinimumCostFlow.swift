//
//  MinimumCostFlow.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-10.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func minimumCostFlow() {
    // create graph
    let firstList: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n: Int = firstList[0]
    let m: Int = firstList[1]
    let d: Int = firstList[2]
    var input: [[Int]] = []
    for i in 0..<m {
        var line: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }
        let isActive: Int = i < n - 1 ? 1 : 0
        line.append(isActive)
        input.append(line)
    }
    input.sort { ($0[2], $1[3]) < ($1[2], $0[3]) }
    
    var uf = UF2(n + 1)
    var needActivePipeCount = 0
    var needInActivePipeCount = n - 1
    for i in 0..<input.count {
        let e = input[i]
        if uf.connected(e[0], e[1]) { continue }
        if i == n - 1 {
            var last: [Int] = input[i]
            var lastIndex: Int = i
            while input[lastIndex][2] <= d && input[lastIndex][3] == 0 && lastIndex < input.count {
                if uf.connected(e[0], e[1]) { last = input[lastIndex] }
                lastIndex += 1
            }
            uf.union(last[0], last[1])
            if last[3] == 0 {
                needActivePipeCount += 1
            } else {
                needInActivePipeCount -= 1
            }
            break
        }
        
        uf.union(e[0], e[1])
        if e[3] == 0 {
            needActivePipeCount += 1
        } else {
            needInActivePipeCount -= 1
        }
    }
    
    print(max(needActivePipeCount, needInActivePipeCount))
}



public struct UF2 {
    /// parent[i] = parent of i
    public var parent: [Int]
    /// size[i] = number of nodes in tree rooted at i
    private var size: [Int]
    /// number of components
    private(set) var count: Int

    /// Initializes an empty union-find data structure with **n** elements
    /// **0** through **n-1**.
    /// Initially, each elements is in its own set.
    /// - Parameter n: the number of elements
    public init(_ n: Int) {
        self.count = n
        self.size = [Int](repeating: 1, count: n)
        self.parent = [Int](repeating: 0, count: n)
        for i in 0..<n {
            self.parent[i] = i
        }
    }

    /// Returns the canonical element(root) of the set containing element `p`.
    /// - Parameter p: an element
    /// - Returns: the canonical element of the set containing `p`
    public mutating func find(_ p: Int) -> Int {
        var root: Int = p
        while (root != parent[root]) {
            parent[root] = parent[parent[root]]
            root = parent[root]
        }
        return root
    }

    /// Returns `true` if the two elements are in the same set.
    /// - Parameters:
    ///   - p: one elememt
    ///   - q: the other element
    /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
    public mutating func connected(_ p: Int, _ q: Int) -> Bool {
        return find(p) == find(q)
    }

    /// Merges the set containing element `p` with the set containing
    /// element `q`
    /// - Parameters:
    ///   - p: one element
    ///   - q: the other element
    public mutating func union(_ p: Int, _ q: Int) {
        let pRoot: Int = find(p)
        let qRoot: Int = find(q)
        if (pRoot == qRoot) { return }
        if (size[pRoot] < size[qRoot]) {
            parent[pRoot] = qRoot
            size[qRoot] += size[pRoot]
        } else {
            parent[qRoot] = pRoot
            size[pRoot] += size[qRoot]
        }
        count -= 1
    }
}

//minimumCostFlow()
