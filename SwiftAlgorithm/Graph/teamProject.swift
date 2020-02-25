//
//  teamProject.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-25.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

//2
//7
//3 1 3 7 3 4 6
//8
//1 2 3 4 5 6 7 8
//
//3
//0

func getNumberOfNoAssignedMember() {
    //  get input
    let countTestCase: Int = Int(readLine()!)!
    for _ in 0..<countTestCase {
        let n: Int = Int(readLine()!)!
        let chooseArray = readLine()!.split(separator: " ")
        print(chooseArray)
    }
}
