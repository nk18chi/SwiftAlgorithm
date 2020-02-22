//
//  getParent.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-21.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

// 1. Who’s my parent? - (55 %)
// time comprexity n!

//1
//6 4
//3 2 7
//5

// 1: None
// 6: 1
// 4: 1
// 3: 6


func getParent() {
    // create dictionary
    var input_lines: [[Int]] = []
    var dict: [Int:Int] = [:]
    let row = Int(readLine()!)!
    for _ in 0..<row - 1 {
        let splited = readLine()!.split(separator: " ")
        input_lines.append([Int(splited[0])!, Int(splited[1])!])
    }
    print(input_lines)
    
    // get parent data
    var nextTarget: [Int] = [1]
    while(nextTarget.count > 0 && input_lines.count > 0) {
        var removedList: [Int] = []
        var temp: [Int] = []
        for target in nextTarget {
            for (i, array) in input_lines.enumerated() {
                var child: Int? = nil
                if array[0] == target {
                    child = array[1]
                } else if array[1] == target {
                    child = array[0]
                }
                
                if child != nil {
                    dict[child!] = target
                    temp.append(child!)
                    removedList.append(i)
                }
            }
        }
        nextTarget = temp
        for r in removedList.reversed() {
            input_lines.remove(at: r)
        }
    }
    
    print(dict)
    // print output
    for i in 2...row {
        print(dict[i]!)
    }
}
