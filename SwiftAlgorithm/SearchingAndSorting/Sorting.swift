//
//  Sorting.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-13.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func quickSort<T : Comparable>(_ array: [T], _ comparator: (T, T) -> Bool) -> [T] {
    if array.count < 2 {
       return array
    }
    
    let target: T = array[0]
    var leftArray: [T] = []
    var rightArray: [T] = []
    for n in array[1..<array.count] {
        comparator(n, target) ? leftArray.append(n) : rightArray.append(n)
    }
    
    var sortedArray: [T] = []
    sortedArray.append(contentsOf: quickSort(leftArray, comparator))
    sortedArray.append(target)
    sortedArray.append(contentsOf: quickSort(rightArray, comparator))
    
    return sortedArray
}
