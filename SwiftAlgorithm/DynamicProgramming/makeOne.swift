//
//  makeOne.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-11.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func makeOne(_ x: Int) -> Int {
    var d = [Int](repeating: 0, count: x + 1)
    for i in 2...x {
        d[i] = d[i - 1] + 1
        if i % 2 == 0 && d[i] > d[i / 2] + 1 {
            d[i] = d[i / 2] + 1
        }
        if i % 3 == 0 && d[i] > d[i / 3] + 1 {
            d[i] = d[i / 3] + 1
        }
    }
    return d[x]
}
