//
//  DiceGameModel.swift
//  dice poker
//

import Foundation

struct DiceGameModel {
    var player1: Player
    var player2: Player
    var currentPlayer: Player
    var round: Int = 0
    var isGameOver: Bool = false
    var isRoundOver: Bool = false
    var roundResults: [Int] = []
    var gameWinner: Int = 0
    
    var player1DiceHistory: [[Dice]] = []
    var player2DiceHistory: [[Dice]] = []
    var player1CombinationHistory: [DiceCombination] = []
    var player2CombinationHistory: [DiceCombination] = []
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        self.currentPlayer = player1
    }

    mutating func rollDice() {
        currentPlayer.rollDice()
        currentPlayer.didMove()
        
        if currentPlayer.id == 1 {
            player1 = currentPlayer
        }
        else if currentPlayer.id == 2 {
            player2 = currentPlayer
        }
    }
    
    mutating func finishPlayerTurn() {
        if currentPlayer.id == 1 {
            player1 = currentPlayer
            player1DiceHistory.append(player1.dice)
            currentPlayer = player2
        }
        else if currentPlayer.id == 2 {
            player2 = currentPlayer
            player2DiceHistory.append(player2.dice)
            finishRound()
            isRoundOver = true
        }
    }
        
    mutating func finishRound() {
        roundResults.append(determineRoundWinner())
        
        gameWinner = determineGameWinner()
        if gameWinner != 0 {
            finishGame()
        }
    }
    
    mutating func startNextRound() {
        isRoundOver = false
        round += 1
        
        player1.dice = Array(repeating: Dice(value: 0, isChosen: false), count: 5)
        player1.movesInRound = 0
        player2.dice = Array(repeating: Dice(value: 0, isChosen: false), count: 5)
        player2.movesInRound = 0
        
        currentPlayer = player1
    }
    
    func determineGameWinner() -> Int {
        var playerWinsCount: [Int: Int] = [:]

        for roundWinner in roundResults {
            playerWinsCount[roundWinner, default: 0] += 1
        }

        for (player, wins) in playerWinsCount {
            if wins >= 2 {
                return player
            }
        }
        return 0
    }

    mutating func determineRoundWinner() -> Int {
        let player1Combination = DiceCombinationHelper.determineDiceSetCombination(for: player1.dice)
        let player2Combination = DiceCombinationHelper.determineDiceSetCombination(for: player2.dice)
        
        player1CombinationHistory.append(player1Combination)
        player2CombinationHistory.append(player2Combination)

        return DiceCombinationHelper.determineWinningDiceSet(diceSet1: player1.dice, diceSet2: player2.dice)
    }
    
    mutating func finishGame() {
        self.isGameOver = true
    }
}
