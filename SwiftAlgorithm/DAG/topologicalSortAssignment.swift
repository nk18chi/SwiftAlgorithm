//
//  TopologicalSortAssignment.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-03.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

// 207. Course Schedule
// https://leetcode.com/problems/course-schedule/
// Runtime: 88 ms, faster than 95.02% of Swift online submissions for Course Schedule.
// Memory Usage: 22.1 MB, less than 14.29% of Swift online submissions for Course Schedule.
// Time complexity: v * m
// memory usage: v + e
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var course: [Set<Int>] = [Set<Int>](repeating: [], count: numCourses)
    func hasLoop(_ id: Int, _ searchKey: Int) -> Bool {
        if course[searchKey].contains(id) { return true }
        for key in course[searchKey] {
            if (hasLoop(id, key)) { return true }
        }
        return false
    }
    for p in prerequisites {
        if hasLoop(p[0], p[1]) { return false }
        course[p[0]].insert(p[1])
    }
    return true
}

// 210. Course Schedule II
// https://leetcode.com/problems/course-schedule-ii/
// Runtime: 92 ms, faster than 88.89% of Swift online submissions for Course Schedule II.
// Memory Usage: 21.2 MB, less than 100.00% of Swift online submissions for Course Schedule II.
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var adj = [[Int]](repeating: [Int](), count: numCourses)
    var indegree = [Int](repeating: 0, count: numCourses)
    
    for p in prerequisites {
        adj[p[1]].append(p[0])
        indegree[p[0]] += 1
    }
    
    // topological sort
    let q = Queue<Int>()
    // initial state
    for v in 0..<numCourses {
        if indegree[v] == 0 {
            q.enqueue(item: v)
        }
    }
    
    // BFS
    var res: [Int] = []
    while !q.isEmpty() {
        let x = q.dequeue()!
        res.append(x)
        for v in adj[x] {
            indegree[v] -= 1 // decrement indegree
            if indegree[v] == 0 {
                q.enqueue(item: v)
            }
        }
    }
    let sum = indegree.reduce(0, +)
    if sum > 0 { return [] }
    return res
}
