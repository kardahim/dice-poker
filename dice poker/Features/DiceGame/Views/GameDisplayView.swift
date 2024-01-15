//
//  GameDisplayView.swift
//  dice poker
//

import SwiftUI

struct GameDisplayView: View {
    @ObservedObject var viewModel: DiceGameViewModel
    @Binding var rollButtonText: String
    @Binding var showDetailedResults: Bool
    @Binding var percentPlayer1: Int
    @Binding var percentPlayer2: Int
    
    var body: some View {
        VStack{
            Text("Round \(viewModel.model.round + 1)")
                .font(.title)
                .padding(5)
            VStack {
                Text("Player \(viewModel.model.currentPlayer.id)'s Turn")
                    .font(.title3)
                    .padding()

                HStack {
                    ForEach(viewModel.model.currentPlayer.dice.indices, id: \.self) { index in
                        DiceView(dice: viewModel.model.currentPlayer.dice[index])
                            .padding(4)
                            .onTapGesture {
                                if viewModel.model.currentPlayer.movesInRound == 1 {
                                    viewModel.chooseDice(index: index)
                                    if viewModel.model.currentPlayer.dice.contains(where: { $0.isChosen }) {
                                        rollButtonText = "Roll chosen again"
                                    }
                                   else {
                                       rollButtonText = "Accept all dice"
                                    }
                                }
                            }
                    }
                }
                    .padding(.bottom, 10)

                if viewModel.model.currentPlayer.movesInRound > 0 {
                    Text("Choose dice for second roll or confirm current set")
                        .padding(2)
                        .font(.caption)
                }
                
                HStack {
                    Button(viewModel.model.currentPlayer.movesInRound < 1 ? "Roll dice" : rollButtonText) {
                        viewModel.rollDice()
                        rollButtonText = "Confirm dice set"
                    }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .disabled(viewModel.model.currentPlayer.movesInRound > 1 ? true : false)
                        .blur(radius: viewModel.model.currentPlayer.movesInRound > 1 ? 1.0 : 0)
                        .opacity(viewModel.model.currentPlayer.movesInRound > 1 ? 0.7 : 1)

                    if viewModel.model.currentPlayer.movesInRound > 0 {
                        Button("Finish turn") {
                            viewModel.finishPlayerTurn()
                            
                            let player1WonRounds = viewModel.model.roundResults.reduce(0) { $0 + ($1 == 1 ? 1: 0) }
                            let player2WonRounds = viewModel.model.roundResults.reduce(0) { $0 + ($1 == 2 ? 1: 0) }
                            percentPlayer2 = 100 - (player1WonRounds * 50)
                            percentPlayer1 = 100 - (player2WonRounds * 50)
                        }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .disabled(viewModel.model.currentPlayer.movesInRound < 2 ? true : false)
                            .blur(radius: viewModel.model.currentPlayer.movesInRound < 2 ? 1.0 : 0)
                            .opacity(viewModel.model.currentPlayer.movesInRound < 2 ? 0.7 : 1.0)
                    }
                }
                
                Spacer()
                
//                currentRoundDiceResults
                
//                Spacer()
                Button("Restart Game") {
                    viewModel.resetGame()
                    showDetailedResults = false
                    percentPlayer1 = 100
                    percentPlayer2 = 100
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                
            }
            .padding()
        }
        .padding(.top, 4)
    }
}
