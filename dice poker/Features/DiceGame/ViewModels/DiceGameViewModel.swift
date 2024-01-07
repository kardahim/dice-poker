//
//  DiceGameViewModel.swift
//  dice poker
//

import Foundation

class DiceGameViewModel: ObservableObject {
    @Published var model = DiceGameModel(
        player1: Player(id: 1, numberOfDice: 5),
        player2: Player(id: 2, numberOfDice: 5)
    )

    func rollDice() {
        model.rollDice()
    }

    func chooseDice(index: Int) {
        model.currentPlayer.dice[index].isChosen.toggle()
    }

    func finishPlayerTurn() {
        model.finishPlayerTurn()
    }
    
    func finishRound() {
        model.finishRound()
    }
    
    func startNextRound() {
        model.startNextRound()
    }

    func resetGame() {
        model = DiceGameModel(
            player1: Player(id: 1, numberOfDice: 5),
            player2: Player(id: 2, numberOfDice: 5)
        )
    }
}
