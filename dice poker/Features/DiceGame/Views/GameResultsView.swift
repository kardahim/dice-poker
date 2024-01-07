//
//  GameResultsView.swift
//  dice poker
//

import SwiftUI

// MARK: Finished game details - with history
struct GameResultsView: View {
    @ObservedObject var viewModel: DiceGameViewModel
    @Binding var rollButtonText: String
    @Binding var showDetailedResults: Bool
    
    var body: some View {
        VStack {
            Text("Game Results")
                .font(.title2)
                .padding(5)
            
            Text("Winner: Player \(viewModel.model.gameWinner)")
                .font(.title3)
                .padding()
            
            Button(!showDetailedResults ? "Show detailed results" : "Hide detailed results") {
                showDetailedResults.toggle()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            if showDetailedResults {
                VStack {
                    ForEach(1...2, id: \.self) { playerIndex in
                        Text("Player \(playerIndex)")
                            .font(.headline)
                        
                        ForEach(0..<viewModel.model.player1DiceHistory.count, id: \.self) { roundIndex in
                            if let diceHistory = playerIndex == 1 ? viewModel.model.player1DiceHistory : viewModel.model.player2DiceHistory,
                               let combinationHistory = playerIndex == 1 ? viewModel.model.player1CombinationHistory : viewModel.model.player2CombinationHistory,
                               !diceHistory.isEmpty, diceHistory.indices.contains(roundIndex), !diceHistory[roundIndex].isEmpty,
                               combinationHistory.indices.contains(roundIndex) {
                                
                                let color = viewModel.model.roundResults[roundIndex] == playerIndex ? Color.green : Color.red
                                
                                HStack {
                                    Text("Round \(roundIndex + 1): ")
                                        .padding(5)
                                        .font(.system(size: 14))
                                        .frame(width:70)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    ForEach(diceHistory[roundIndex], id: \.self) { dice in
                                        Image("dice_\(dice.value)")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                    }
                                    Text("\(combinationLabel(for: combinationHistory[roundIndex].rawValue))")
                                        .padding(1)
                                        .background(color
                                            .blur(radius:5)
                                            .opacity(0.5)
                                        )
                                        .font(.system(size: 14))
                                    
                                    Spacer()
                                }
                                .padding(.leading, 4)
                                Text("")
                            }
                        }
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        .background(Color.gray.opacity(0.1))
                )
                .cornerRadius(10)
            }
            
            Spacer()
            Button("Play Again") {
                viewModel.resetGame()
                rollButtonText = "Accept all dice"
                showDetailedResults = false
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}
