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
        }
    }
    
    mutating func finishRound() {
        // Dodaj wynik do tablicy - który gracz wygrał rundę
        roundResults.append(determineRoundWinner())
        
        // Zwiększ numer rundy
        round += 1
        
        player1.dice = Array(repeating: Dice(value: 0, isChosen: false), count: 5)
        player1.movesInRound = 0
        player2.dice = Array(repeating: Dice(value: 0, isChosen: false), count: 5)
        player2.movesInRound = 0
        
        currentPlayer = player1

        gameWinner = determineGameWinner()
        if gameWinner != 0 {
            finishGame()
        }
    }
    
    func determineGameWinner() -> Int {                 // sprawdzic poprawnosc
        var playerWinsCount: [Int: Int] = [:]

        // Zlicz wygrane dla każdego gracza
        for roundWinner in roundResults {
            playerWinsCount[roundWinner, default: 0] += 1
        }

        // Sprawdź czy któryś z graczy wygrał dwie rundy
        for (player, wins) in playerWinsCount {
            if wins >= 2 {
                return player
            }
        }
        return 0
    }

    mutating func determineRoundWinner() -> Int {
        let player1Combination = evaluateRoll(for: player1.dice)
        let player2Combination = evaluateRoll(for: player2.dice)
        
        player1CombinationHistory.append(player1Combination)
        player2CombinationHistory.append(player2Combination)

        if player1Combination.rawValue > player2Combination.rawValue {
            return 1
        } else if player2Combination.rawValue > player1Combination.rawValue {
            return 2
        }
//        else if { // trzeba sprawdzić jeszcze liczby oczek w układzie w przypadku takiego samego układu np. para piatek > para dwójek
//
//        }
        
        else {
            // W przypadku remisu, sprawdzamy sumę oczek na kościach
            let player1Total = player1.dice.reduce(0) { $0 + $1.value }
            let player2Total = player2.dice.reduce(0) { $0 + $1.value }

            if player1Total > player2Total {
                return 1
            } else if player2Total > player1Total {
                return 2
            } else {
                // Jeśli nadal remis, zwracamy 0
                return 0
            }
        }
    }
    
    func evaluateRoll(for dice: [Dice]) -> DiceCombination {
        let sortedValues = dice.map { $0.value }.sorted()

        func hasTwoPairs() -> Bool {
            var pairCount = 0
            var index = 0
            while index < sortedValues.count - 1 {
                if sortedValues[index] == sortedValues[index + 1] {
                    pairCount += 1
                    index += 2
                } else {
                    index += 1
                }
            }
            return pairCount == 2
        }

        func hasThreeOfAKind() -> Bool {
            var index = 0
            while index < sortedValues.count - 2 {
                if sortedValues[index] == sortedValues[index + 1] && sortedValues[index] == sortedValues[index + 2] {
                    return true
                }
                index += 1
            }
            return false
        }

        func hasSmallStraight() -> Bool {
            let uniqueValues = Array(Set(sortedValues))
            return uniqueValues.count >= 5 && uniqueValues.max()! - uniqueValues.min()! == 4
        }

        func hasLargeStraight() -> Bool {
            return Set(sortedValues).count == 5 && sortedValues.max()! - sortedValues.min()! == 4
        }

        func hasFullHouse() -> Bool {
            return (sortedValues[0] == sortedValues[1] && sortedValues[2] == sortedValues[4]) ||
                   (sortedValues[0] == sortedValues[2] && sortedValues[3] == sortedValues[4])
        }

        func hasFourOfAKind() -> Bool {
            return sortedValues[0] == sortedValues[3] || sortedValues[1] == sortedValues[4]
        }

        func hasPoker() -> Bool {
            return sortedValues[0] == sortedValues[4]
        }

        if hasPoker() {
            return .poker
        } else if hasFourOfAKind() {
            return .fourOfAKind
        } else if hasFullHouse() {
            return .fullHouse
        } else if hasLargeStraight() {
            return .largeStraight
        } else if hasSmallStraight() {
            return .smallStraight
        } else if hasThreeOfAKind() {
            return .threeOfAKind
        } else if hasTwoPairs() {
            return .twoPairs
        } else if sortedValues[0] == sortedValues[1] || sortedValues[1] == sortedValues[2] ||
                  sortedValues[2] == sortedValues[3] || sortedValues[3] == sortedValues[4] {
            return .onePair
        } else {
            return .none
        }
    }
    
    mutating func finishGame() {
        self.isGameOver = true
    }
}
