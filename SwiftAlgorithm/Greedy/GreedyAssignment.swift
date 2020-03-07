//
//  GreedyAssignment.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-04.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

// 1029. Two City Scheduling
// https://leetcode.com/problems/two-city-scheduling/submissions/
// Runtime: 20 ms, faster than 92.59% of Swift online submissions for Two City Scheduling.
// Memory Usage: 20.9 MB, less than 100.00% of Swift online submissions for Two City Scheduling.
// time complexity : nlogn + n -> O(n)
// memory : constant
func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    let costsSorted = costs.sorted { ($0[1] - $0[0]) > ($1[1] - $1[0]) }
    var cost: Int = 0
    let mid: Int = costs.count / 2
    var index = 0
    for arr in costsSorted {
        cost += index < mid ? arr[0] : arr[1]
        index += 1
    }
    return cost
}


// 621. Task Scheduler
// https://leetcode.com/problems/task-scheduler/
// Runtime: 1088 ms, faster than 19.40% of Swift online submissions for Task Scheduler.
// Memory Usage: 22.8 MB, less than 100.00% of Swift online submissions for Task Scheduler.
func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var charDict: [Character:Int] = [:]
    for task in tasks {
        if charDict.keys.contains(task) {
            charDict[task]! += 1
        } else {
            charDict[task] = 1
        }
    }
    var sortedCharDict = charDict.sorted { $0.value < $1.value }
    var count: Int = 0
    let length = sortedCharDict.count
    while sortedCharDict[length-1].value > 0 {
        var i = 0
        while (i <= n && sortedCharDict[length-1].value > 0) {
            if i < length && sortedCharDict[length - i - 1].value > 0 {
                sortedCharDict[length - i - 1].value -= 1
            }
            count += 1
            i += 1
        }
        sortedCharDict = sortedCharDict.sorted { $0.value < $1.value } // it is slow because every time array is sorted(NlogN)
    }
    return count
}

// 134. Gas Station
// https://leetcode.com/problems/gas-station/submissions/
// first solution
// Runtime: 36 ms, faster than 65.85% of Swift online submissions for Gas Station.
// Memory Usage: 21.1 MB, less than 50.00% of Swift online submissions for Gas Station.
//func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
//    var diff: [Int] = [Int](repeating: 0, count: gas.count)
//    for i in 0..<gas.count {
//        diff[i] = gas[i] - cost[i]
//    }
//
//    var i: Int = 0
//    while i < diff.count {
//        var sum: Int = 0
//        var count: Int = 0
//        var j: Int = i
//        while sum >= 0  {
//            if count == diff.count { return i }
//            if j == diff.count { j = 0 }
//            sum += diff[j]
//            count += 1
//            j += 1
//        }
//        if j > i { i = j }
//        else { i += 1 }
//    }
//    return -1
//}

// second solution
// Runtime: 36 ms, faster than 65.85% of Swift online submissions for Gas Station.
// Memory Usage: 21.1 MB, less than 50.00% of Swift online submissions for Gas Station.
//func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
//    var diff: [Int] = [Int](repeating: 0, count: gas.count)
//    for i in 0..<gas.count {
//        diff[i] = gas[i] - cost[i]
//    }
//
//    var sum = diff.reduce(0, +)
//    if sum < 0 { return -1 }
//    var pointer = 0
//    sum = 0
//    for i in (0..<diff.count).reversed() {
//        if sum >= 0 && diff[i] < 0 { sum = 0 }
//        sum += diff[i]
//        if sum >= 0 {
//            pointer = i
//        }
//    }
//    return pointer
//}

// third solution
// Runtime: 36 ms, faster than 65.85% of Swift online submissions for Gas Station.
// Memory Usage: 20.9 MB, less than 50.00% of Swift online submissions for Gas Station.
func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var res: Int = 0
    var total: Int = 0
    var tank: Int = 0
    for i in (0..<gas.count).reversed() {
        let diff: Int = gas[i] - cost[i]
        total += diff
        tank += diff
        if tank >= 0 && diff > 0 {
            res = i
            tank = 0
        }
    }
    return total < 0 ? -1 : res
}


// 763. Partition Labels
// https://leetcode.com/problems/partition-labels/
// first solution
// Runtime: 36 ms, faster than 28.57% of Swift online submissions for Partition Labels.
// Memory Usage: 22.7 MB, less than 100.00% of Swift online submissions for Partition Labels.
//func partitionLabels(_ S: String) -> [Int] {
//    var group: [Character] = [Character](repeating: "A", count: S.count)
//    var dict: [Character:Int] = [:]
//    var index: Int = 0
//    var i: Int = 0
//    for char in S {
//        group[i] = char
//        if dict.keys.contains(char) {
//            var j: Int = i - 1
//            while (dict[group[j]] != dict[char]) {
//                dict[group[j]] = dict[char]
//                j -= 1
//            }
//        } else {
//            dict[char] = index
//            index += 1
//        }
//        i += 1
//    }
//    let sortedDict = dict.sorted() { $0.value < $1.value }
//    var indexDict: [Int:Int] = [:]
//    index = 0
//    for s in sortedDict {
//        if indexDict.keys.contains(s.value) { continue }
//        indexDict[s.value] = index
//        index += 1
//    }
//    print(dict)
//    print(indexDict)
//    var res: [Int] = [Int](repeating: 0, count: index)
//    for c in S {
//        let val: Int = dict[c]!
//        res[indexDict[val]!] += 1
//    }
//    return res
//
//}

// second solution
// Runtime: 16 ms, faster than 95.24% of Swift online submissions for Partition Labels.
// Memory Usage: 21 MB, less than 100.00% of Swift online submissions for Partition Labels.
func partitionLabels(_ S: String) -> [Int] {
    var tableMap: [Character:Int] = [:]
    var index: Int = 1
    for c in S {
        tableMap[c] = index
        index += 1
    }
    var res: [Int] = []
    var start: Int = 0
    var end: Int = 0
    index = 1
    for c in S {
        end = max(end, tableMap[c]!)
        if end == index {
            res.append(end - start)
            start = end
        }
        index += 1
    }
    return res
}

// 630. Course Schedule III
// https://leetcode.com/problems/course-schedule-iii/
// first solution(Brute-force search)
// Time limit exceeded though...
func scheduleCourse(_ courses: [[Int]]) -> Int {
    func dfs(_ restsCourses: [[Int]], _ time: Int, _ count:Int) -> Int {
        var maxVal: Int = count
        for i in 0..<restsCourses.count {
            if restsCourses[i][1] < time + restsCourses[i][0] { continue }
            let newTime: Int = time + restsCourses[i][0]
            var newCourse: [[Int]] = restsCourses
            newCourse.remove(at: i)
            let val: Int = dfs(newCourse, newTime, count + 1)
            maxVal = max(maxVal, val)
        }
        return maxVal
    }
    return dfs(courses, 0, 0)
}
