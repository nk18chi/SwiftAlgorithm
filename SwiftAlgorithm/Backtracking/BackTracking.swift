//
//  BackTracking.swift
//  SwiftAlgorithm
//
//  Created by Naoki Mita on 2020-02-14.
//  Copyright © 2020 Naoki Mita. All rights reserved.
//

import Foundation

func rollDiceSum(dice: Int, sum: Int, _ chosen: inout [Int]) {
    guard dice >= 0 else { return }
    guard sum >= 0 else { return }
    if dice == 0 && sum == 0 {
        print(chosen)
        return
    }
    
    for n in 1...6 {
        var newChosen = chosen
        newChosen.append(n)
        rollDiceSum(dice: dice - 1, sum: sum - n, &newChosen)
    }
}


func runRollDice() {
    var chosen: [Int] = []
    rollDiceSum(dice: 3, sum: 6, &chosen)
}
