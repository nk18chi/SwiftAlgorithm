//
//  maze.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-03-20.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation


//func maze() {
//    let t: Int = Int(readLine()!)!
//    
//    func getMinumumPath(_ arr: [[Int]]) -> Int {
//        q = Queue<Int>()
//        q.enqueu()
//        
//        return 0
//    }
//    
//    for _ in 0..<t {
//        let r: Int = Int(readLine()!)!
//        let c: Int = Int(readLine()!)!
//        var arr: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
//        for i in 0..<r {
//            let input: String = readLine()!
//            for j in 0..<c {
//                var n: Int = 0
//                switch input[j] {
//                case "+":
//                    n = 1
//                case "-":
//                    n = 2
//                case "|":
//                    n = 3
//                default:
//                    n = 0
//                }
//                arr[i][j] = n
//            }
//            print(getMinumumPath(arr))
//        }
//        
//    }
//    
//}
