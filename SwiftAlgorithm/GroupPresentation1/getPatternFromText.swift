//
//  findPatternFromText.swift
//  SwiftAlgorithm
//
//  Created by 美田直毅 on 2020-02-22.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func getPatternFromTest(pattern: String, text: String) {
    var dict: [Character: Int] = [:]

    for (i, c) in pattern.enumerated() {
        dict[c] = pattern.count - i - 1
    }

    func helper() -> Int {
        var tPointer: Int = pattern.count - 1
        var pPointer: Int = 0

        while (tPointer < text.count) {
            pPointer = pattern.count - 1
            while (pPointer >= 0 && tPointer < text.count) {
                guard text[tPointer] == pattern[pPointer] else { break }
                tPointer -= 1
                pPointer -= 1
            }
            if pPointer < 0 {
                return tPointer + 1
            }
            
            let shift1: Int = dict.keys.contains(Character(text[tPointer])) ? dict[Character(text[tPointer])]! : pattern.count;
            let shift2: Int = pattern.count - pPointer;
            tPointer += max(shift1, shift2);
        }
        return -1
    }
    print(helper())
}
