//
//  happy.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-20.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

// Problem 2: Happy or Sad (happy.swift) - 20 points
// :-(:-(:-(:-):-):-:-):-):-:-)
func happy() -> String {
    let input: String = readLine()!
    var happyCount: Int = 0
    var sadCount: Int = 0
    var index: Int = 0
    while index < input.count {
        if input[index] != ":" {
            index += 1
            continue
        }
        
        if index + 2 < input.count && input[index + 1] == "-" {
            if input[index + 2] == ")" {
                happyCount += 1
                index += 2
            }
            else if input[index + 2] == "(" {
                sadCount += 1
                index += 2
            }
        }
        index += 1
    }
    
    if happyCount == 0 && sadCount == 0 {
        return "none"
    }
    else if happyCount == sadCount {
        return "unsure"
    }
    else if happyCount > sadCount {
        return "happy"
    }
    else if happyCount < sadCount {
        return "sad"
    }
    
    return ""
}
