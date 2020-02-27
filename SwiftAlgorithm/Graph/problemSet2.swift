//
//  problemSet2.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-27.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func getCyclicPermutation() {
    let testCases: Int = Int(readLine()!)!
    for _ in 0..<testCases {
        let n: Int = Int(readLine()!)!
        let e = readLine()!.split(separator: " ")
        var uf = UF(n + 1)
        var count: Int = 0
        for j in 0..<n {
            if uf.connected(j, Int(e[j])! - 1) {
                count += 1
                continue
            }
            uf.union(j, Int(e[j])! - 1)
        }
        print(count)
    }
}
