//
//  Player.swift
//  dice poker
//

import Foundation

struct Player {
    var id: Int
    var dice: [Dice]
    var movesInRound: Int
    
    init(id: Int, numberOfDice: Int) {
        self.id = id
        self.dice = Array(repeating: Dice(value: 0, isChosen: false), count: numberOfDice)
        self.movesInRound = 0
    }
    
    mutating func rollDice() {
        if self.movesInRound == 0 {
            self.dice = self.dice.map { dice in
                return Dice(value: Int.random(in: 1...6), isChosen: false)
            }
        }
        else {
            self.dice = self.dice.map { dice in
                    if dice.isChosen {
                        return Dice(value: Int.random(in: 1...6), isChosen: false)
                    } else {
                        return dice
                    }
                }
        }
    }
    
    mutating func didMove() {
        self.movesInRound += 1
    }
}
