//
//  getLowestCommonAncestor.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-22.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation


// time complexity( O(n) solution )
// storage ( O(n)? )
func getLowestCommonAncestor() {
    // get input
    print("Input")
    let n = Int(readLine()!)!
    var tree = [[Int]](repeating: [], count: n + 1)
    for _ in 0..<n - 1 {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        tree[u].append(v)
        tree[v].append(u)
    }
    var questionInputLines: [[Int]] = []
    let m = Int(readLine()!)!
    for _ in 0..<m {
        let splited = readLine()!.split(separator: " ")
        questionInputLines.append([Int(splited[0])!, Int(splited[1])!])
    }
    
    // get lowest common ancestor
    func dfs(_ search: Int, _ target: [Int], _ seen: inout Set<Int>, _ res: inout Int?) -> Int {
        guard res == nil else { return 0 }
        guard tree.count > search else { return 0 }
        seen.insert(search)
        var sum: Int = target.contains(search) ? 1 : 0
        for n in tree[search] {
            if seen.contains(n) { continue }
            sum += dfs(n, target, &seen, &res)
        }
        if sum > 1 {
            res = search
            sum = 1
        }
        
        return sum
    }
    print()
    print("Output")
    for q in questionInputLines {
        var seen: Set<Int> = []
        var res: Int? = nil
        dfs(1, q, &seen, &res)
        print(res ?? -1)
    }
}
