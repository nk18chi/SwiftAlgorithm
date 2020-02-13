//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 美田直毅 on 2020-02-10.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

// evaluate
//print(evaluate("7"))
//print(evaluate("(2+2)"))
//print(evaluate("(1+(2*4))"))
//print(evaluate("((1+3)+((1+2)*5))"))

// Search
//print(linearSearch([1,2,3,4,5,6,7], 5))
//print(binarySearch([1,2,3,4,5,6,7], 5))
//print(binarySearch([4,5,6,7,1,2,3], 5))
//print(linearSearch([1,2,3,4,5,6,7], 8))
//print(binarySearch([1,2,3,4,5,6,7], 8))

// permutation
//permutation("aa")
//permutation("park")

// API
var nums = Bag<Int>()
print(nums.isEmpty())
nums.add(item: 1)
nums.add(item: 2)
nums.add(item: 3)

for n in nums {
    print(n)
}
