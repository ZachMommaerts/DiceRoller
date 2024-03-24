//
//  ContentView.swift
//  DiceRoller
//
//  Created by Zach Mommaerts on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numberOfDice = 2
    @State private var currentRoll = DiceRoll.example
    @State private var rollHistory = [DiceRoll]()
    @State private var numberOfSides = 6
    private var diceConfigurations = [6,8,10,12,20,100]
    
    var body: some View {
        VStack {
            Text("Roll the dice!")
            HStack {
                ForEach(0..<currentRoll.dice.count, id: \.self){ index in
                    VStack {
                        Text("Roll \(index + 1)")
                        Text("\(currentRoll.dice[index])")
                    }
                }
                VStack {
                    Text("Total")
                    Text("\(currentRoll.total)")
                }
            }
            Text("\(numberOfDice) dice")
            Slider(value: .convert(from: $numberOfDice), in: 2...5, step: 1)
            Picker("Number of sides", selection: $numberOfSides) {
                ForEach(diceConfigurations, id: \.self) {
                    Text(String($0))
                }
            }
            .pickerStyle(.segmented)
            Button("Roll!") {
                var tempRollArray = [Int]()
                var total = 0
                for _ in 0..<numberOfDice {
                    var roll = Int.random(in: 1...numberOfSides)
                    tempRollArray.append(roll)
                    total += roll
                }
                var newRoll = DiceRoll(dice: tempRollArray, total: total)
                rollHistory.append(newRoll)
                currentRoll = newRoll
            }
            List(rollHistory) { roll in
                ForEach(roll.dice, id: \.self) { die in
                    HStack {
                        Text("\(die)")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
