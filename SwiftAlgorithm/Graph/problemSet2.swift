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

func getRepeatingSequence() {
    let input: [Substring]  = readLine()!.split(separator: " ")
    var A: Int = Int(input[0])!
    let P: Int = Int(input[1])!
    var dict: [Int:Int] = [:]
    func helper(num: Int, power: Int) -> Int {
        var quotient: Int = num
        var sum: Double = 0
        while(quotient != 0) {
            sum += pow(Double(quotient % 10), Double(power))
            quotient = quotient / 10
        }
        return Int(sum)
    }
    var index: Int = 0
    while !dict.keys.contains(A) {
        dict[A] = index
        A = helper(num: A, power: P)
        index += 1
    }
    print(dict[A]!)
}

