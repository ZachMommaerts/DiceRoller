//
//  DiceRoll.swift
//  DiceRoller
//
//  Created by Zach Mommaerts on 3/11/24.
//

import Foundation

struct DiceRoll: Identifiable {
    var id = UUID()
    var dice: [Int]
    var total: Int
    
    static let example = DiceRoll(dice: [2,4], total: 6)
}
