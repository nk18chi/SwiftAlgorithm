//
//  corona.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-20.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func corona() -> Int {
    let p: Int = Int(readLine()!)!
    let n: Int = Int(readLine()!)!
    let r: Int = Int(readLine()!)!
    
    var days: Int = 0
    var victims: Int = n
    var prev: Int = n
    while victims <= p {
        victims += prev * r
        prev = prev * r
        days += 1
    }
    return days
}
