//
//  DiceGameView.swift
//  dice poker
//

import SwiftUI

struct DiceGameView: View {
    @ObservedObject var viewModel: DiceGameViewModel
//    @State var isAnyChosen: Bool = false
    @State var rollButtonText: String = "Accept all dice"

    var body: some View {
        Text("Dice Game")
            .font(.title)
            .padding()
            
        if !viewModel.model.isGameOver {
            gameDisplay
        }
        else {
            ScrollView {
                resultDisplay
            }
        }
        
    }
    
    
    var gameDisplay: some View{
        return VStack{
            Text("Round \(viewModel.model.round + 1)")
                .font(.title2)
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
                                if viewModel.model.currentPlayer.movesInRound > 0 {
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

                Button(viewModel.model.currentPlayer.movesInRound < 1 ? "Roll dice" : rollButtonText) {
                    viewModel.rollDice()
                }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
                if viewModel.model.roundResults.count > 0 {
                    Text("Current results:")
                        .padding(5)
                    ForEach(0..<viewModel.model.roundResults.count, id: \.self) { roundIndex in
                        let roundWinner = viewModel.model.roundResults[roundIndex]
                            Text("Round \(roundIndex + 1) winner: Player \(roundWinner)")
                                .padding(2)
                        }
                }
                
                Spacer()
                Button("Restart Game") {
                    viewModel.resetGame()
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                
            }
            .padding()
        }
    }
    
    var resultDisplay: some View {
        return VStack{
            Text("Results")
                .font(.title2)
                .padding(5)
            
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
                                    .font(.body)
                                    .padding(5)
                                
                                ForEach(diceHistory[roundIndex], id: \.self) { dice in
                                    Image("dice_\(dice.value)")
                                        .resizable()
                                        .frame(width: 26, height: 26)
                                        .background(color)
                                }
                                Text("\(combinationLabel(for: combinationHistory[roundIndex].rawValue))")
                                    .padding(1)
                                
                            }
//                            Text("Combination: \(combinationLabel(for: combinationHistory[roundIndex].rawValue))")
//                                .padding(5)
                            Text("")
                        }
                    }
                }
            }
            .background(Color.yellow.opacity(0.5))
            .cornerRadius(10)
            
//            ForEach(0..<viewModel.model.roundResults.count, id: \.self) { roundIndex in
//                let roundWinner = viewModel.model.roundResults[roundIndex]
//                    Text("Round \(roundIndex + 1) winner: Player \(roundWinner)")
//                        .padding(5)
//                }
            Text("Game Winner: Player \(viewModel.model.gameWinner)")
                .font(.title3)
                .padding()
            
            
            Spacer()
            Button("Play Again") {
                viewModel.resetGame()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
    
}

//struct DiceGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiceGameView()
//    }
//}
