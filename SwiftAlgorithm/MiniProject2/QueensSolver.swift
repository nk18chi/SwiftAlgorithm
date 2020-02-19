//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.


var countForTask1 = 0
// Task 1
func getAllPosibbleWays(board: inout Board, col: Int) {
    if col == 8 {
        print(board)
        countForTask1 += 1
        return
    }
    for i in 0..<8 {
        guard board.isSafe(row: i, col: col) else { continue }
        board.place(row: i, col: col)
        getAllPosibbleWays(board: &board, col: col + 1)
        board.remove(row: i, col: col)
    }
}

var countForTask2 = 0
// Task 2
func getOnePosibbleWays(board: inout Board, col: Int, isAnswer: inout Bool) {
    countForTask2 += 1
    if col == 8 {
        print(board)
        isAnswer = true
        return
    }
    for i in 0..<8 {
        guard !isAnswer else { return }
        guard board.isSafe(row: i, col: col) else { continue }
        board.place(row: i, col: col)
        getOnePosibbleWays(board: &board, col: col + 1, isAnswer: &isAnswer)
        board.remove(row: i, col: col)
    }
}
