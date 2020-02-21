//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 美田直毅 on 2020-02-10.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

//// evaluate
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

// QUick Soring
//print(quickSort([3,2,4,1,5], <))

// permutation
//permutation("aa")
//permutation("park")

// Bag API
//var nums = Bag<Int>()
//print(nums.isEmpty())
//nums.add(item: 1)
//nums.add(item: 2)
//nums.add(item: 3)
//
//for n in nums {
//    print(n)
//}

//// Queue API
//var q = Queue<Int>()
//print(q.isEmpty())
//q.enqueue(item: 1)
//q.enqueue(item: 2)
//q.enqueue(item: 3)
//print(q.peek() ?? 0)
//print(q.dequeue() ?? 0)
//print(q.peek() ?? 0)
//q.enqueue(item: 4)
//print(q.isEmpty())
//
//while (q.peek() != nil) {
//    print(q.dequeue() ?? 0)
//}
//print(q.isEmpty())

//// stack API
//var s = Stack<Int>()
//print(s.isEmpty())
//s.push(item: 1)
//print(s.peek() ?? 0)
//s.push(item: 2)
//print(s.peek() ?? 0)
//s.push(item: 3)
//print(s.peek() ?? 0)
//print(s.pop() ?? 0)
//print(s.peek() ?? 0)
//s.push(item: 4)
//s.push(item: 5)
//print(s.isEmpty())
//
//while (s.peek() != nil ){
//    print(s.pop() ?? 0)
//}
//print(s.isEmpty())

// Backtracking
//runRollDice()

// Mini Project
//showDirectories()

//// Mini Project 2 (Taks1)
//var b = Board(size: 8)
//getAllPosibbleWays(board: &b, col: 0)
//print("\(countForTask1) possible ways")

// Mini Project 2 (Taks2)
//var b = Board(size: 8)
//var isAnswer = false
//getOnePosibbleWays(board: &b, col: 0, isAnswer: &isAnswer)
//print("Number of recursive calls: \(countForTask2)")

// Group Presenatation
// 1. Find the smallest/largest M elements in a stream of N items.
let n: Int = 7
var arr: [Int] = Array(repeating: 0, count: n)
let m = 3
let queue: CustomPriorityQueue<Int> = CustomPriorityQueue(m) { $0 > $1 }

for i in 0..<n {
    arr[i] = Int.random(in: 1...10000)
    queue.insert(arr[i])
}

var res: [Int] = Array(repeating: 0, count: m)
var j = 0
while (queue.peek() != nil) {
    res[j] = queue.pop()!
    j += 1
}
print("Original Array")
print(arr)
print()
print("heap sort(nlogm solution)")
print(res)
print()
print("normal sort(nlogn solution)")
let sortedArray: [Int] = arr.sorted { $0 > $1 }
print(sortedArray[0..<m])
