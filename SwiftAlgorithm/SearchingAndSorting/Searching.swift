//
//  Searching.swift
//  SwiftAlgorithm
//
//  Created by 美田直毅 on 2020-02-10.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func linearSearch(_ array:[Int], _ target: Int) -> Int {
    for i in 0..<array.count {
        if array[i] == target {
            return i
        }
    }
    return -1
}

func binarySearch(_ array:[Int], _ target: Int) -> Int {
    var left: Int = 0
    var right: Int = array.count
    var sortedArr = array.map {$0}
    sortedArr.sort()
    while left > right {
        let mid: Int = (right + left) / 2
        if sortedArr[mid] == target {
            return mid
        }
        if (sortedArr[mid] < target) {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return -1
}
