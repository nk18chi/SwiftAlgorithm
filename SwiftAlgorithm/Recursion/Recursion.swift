//
//  Recursion.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-11.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

// 1. power(base, exponent): base^exponent
// assume exponent >= 0
func power(base: Int, exponent: Int) -> Int {
    // base case
    if exponent == 0 { return 1 }
    // recursive case
    return base * power(base: base, exponent: exponent - 1)
}

// 2. isPalindrome(word): check if a word is palindrome
// "racecar" -> true
// "hello" -> false
func isPalindrome(_ word: String) -> Bool {
    // base case
    if word.count <= 1 { return true }
    // recursive case (how is this self-similar?)
    if let first = word.first, let last = word.last, first == last {
        return isPalindrome(word[1, word.count-1])
    }
    return false
}

// 3. printBinary(int): prints binary form of given int input
func printBinary(_ num: Int) {
    // if negative number, just add "-" at the front
    if num < 0 {
        print("-", terminator: "")
        printBinary(-num)
        return
    }
    // base case
    if num < 2 {
        print(num, terminator: "") // print without newline
        return
    }
    // recursive
    printBinary(num / 2)
    print(num % 2, terminator: "")
}

// 4. reverseLines
// - Print all lines in reverse order (recursively) from a text file
// - You can change the function header if you want.
func reverseLines(_ line: Int) {
    let contents = try! String(contentsOfFile: "/Users/park/Desktop/SwiftAlgorithmsDataStructures/SwiftAlgorithmsDataStructures/Recursion/story.txt", encoding: .utf8)
    let lines = contents.split(separator: "\n")
    // MARK: - YOUR RECURSIVE CODE
}

func calculate(_ first: Int, _ second: Int, _ sign: String) -> Int {
    switch sign {
    case "+":
        return first + second
    default:
        return first * second
    }
}

func evaluate(_ s: String) -> Int {
    if s.count < 2 {
        return Int(s) ?? 0
    }
    
    var stack: Int = 0
    let newArray: String = s[1, s.count-1]
    var i: Int = 0
    while i < newArray.count {
        switch newArray[i] {
        case "(":
            stack += 1
        case ")":
            stack -= 1
        default:
            if stack == 0 {
                if newArray[i] == "+" || newArray[i] == "*" {
                    let left: Int = evaluate(newArray[0, i])
                    let comparator: String = newArray[i]
                    let right: Int = evaluate(newArray[i+1, newArray.count])
                    return calculate(left, right, comparator)
                }
            }
        }
        i += 1
    }
    return -1
}

