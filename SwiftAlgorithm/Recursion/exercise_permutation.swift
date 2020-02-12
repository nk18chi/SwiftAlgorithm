//
//  exercise_p.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-12.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func permutation(_ s: String, _ res: String = "") {
    if s.count == 0 {
        print(res)
    } else {
        for i in 0..<s.count {
            permutation(s[0,i] + s[i+1,s.count], res + String(s[i]))
        }
    }
}
