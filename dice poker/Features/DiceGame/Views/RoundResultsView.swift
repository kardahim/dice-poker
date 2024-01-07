//
//  RoundResultsView.swift
//  dice poker
//

import SwiftUI

struct RoundResultsView: View {
    @ObservedObject var viewModel: DiceGameViewModel
    @Binding var rollButtonText: String
    @Binding var showDetailedResults: Bool
    
    var body: some View {
        VStack {
            Text("Round \(viewModel.model.round + 1)")
                .font(.title)
                .padding(5)
            
            if viewModel.model.roundResults.count > 0 {
                Text("Current results:")
                    .padding(10)
                
                ForEach(0..<viewModel.model.roundResults.count, id: \.self) { roundIndex in
                    let roundWinner = viewModel.model.roundResults[roundIndex]
                    if roundWinner != 0 {
                        Text("Round \(roundIndex + 1) winner: Player \(roundWinner)")
                            .padding(2)
                    }
                    else {
                        Text("Round \(roundIndex + 1) winner: DRAW!")
                            .padding(2)
                    }
                }
            }
            
            Button("Next round") {
                viewModel.startNextRound()
            }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            
            Spacer()
            
            Button("Restart Game") {
                viewModel.resetGame()
                rollButtonText = "Accept all dice"
                showDetailedResults = false
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding(.top, 4)
    }
}
