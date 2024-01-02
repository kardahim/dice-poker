//
//  DiceGameView.swift
//  dice poker
//

import SwiftUI

struct DiceGameView: View {
    @ObservedObject var viewModel: DiceGameViewModel
    @State var rollButtonText: String = "Accept all dice"
    @State var showDetailedResults: Bool = false

    var body: some View {
        topHeaderDisplay
        
        Divider()
            .frame(maxWidth: .infinity, maxHeight: 1)
            .background(Color.gray)
 
        playerPointsDisplay
            
        if !viewModel.model.isGameOver {
            if !viewModel.model.isRoundOver {
                gameDisplay
            }
            else {
                roundOverDisplay
            }
        }
        else {
            ScrollView {
                resultDisplay
            }
        }
    }
    
    var topHeaderDisplay: some View {
        return HStack {
            Image("dice_5")
                .resizable()
                .frame(width: 36, height: 36)
                .background(Color.blue)
                .cornerRadius(4)
            
            Text("Dice Game")
                .font(.title)
            
            Image("dice_4")
                .resizable()
                .frame(width: 36, height: 36)
                .background(Color.red)
                .cornerRadius(4)
        }
        .padding(.top, 1)
    }
    
    var playerPointsDisplay: some View {
        let player1WonRounds = viewModel.model.roundResults.reduce(0) { $0 + ($1 == 1 ? 1: 0) }
        let player2WonRounds = viewModel.model.roundResults.reduce(0) { $0 + ($1 == 2 ? 1: 0) }
        let percentPlayer2 = 100 - (player1WonRounds * 50)
        let percentPlayer1 = 100 - (player2WonRounds * 50)
        
        return VStack{
            HStack {
                Text("Player 1 ")
                ScoreCircleView(percent: Int(percentPlayer1), isFirstPlayer: true)
                    .frame(width: 30, height: 30)
                Spacer()
                ScoreCircleView(percent: Int(percentPlayer2), isFirstPlayer: false)
                    .frame(width: 30, height: 30)
                Text(" Player 2")
            }
            .padding(.horizontal, 50)
        }
    }
    
    var currentRoundDiceResults: some View {
        return VStack {
            Text("Player dice")
                .padding(2)
            HStack{
                Text("Player 1")
                    .font(.headline)
                ForEach(viewModel.model.player1.dice, id: \.self) { dice in
                    Image("dice_\(dice.value)")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .background(Color.white)
                }
            }
            HStack{
                Text("Player 2")
                    .font(.headline)
                ForEach(viewModel.model.player2.dice, id: \.self) { dice in
                    Image("dice_\(dice.value)")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .background(Color.white)
                }
            }
        }
            .padding(5)
    }
    
    var gameDisplay: some View {
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

                    if viewModel.model.currentPlayer.movesInRound > 0 {
                        Button("Finish turn") {
                            viewModel.finishPlayerTurn()
                        }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .disabled(viewModel.model.currentPlayer.movesInRound < 2 ? true : false)
                            .blur(radius: viewModel.model.currentPlayer.movesInRound < 2 ? 1.0 : 0)
                    }
                }
                
                Spacer()
                
                currentRoundDiceResults
                
//                Spacer()
                Button("Restart Game") {
                    viewModel.resetGame()
//                    rollButtonText = "Accept all dice"
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                
            }
            .padding()
        }
    }
    
    var roundOverDisplay: some View {
        return VStack {
            Text("Round \(viewModel.model.round + 1)")
                .font(.title2)
                .padding(5)
            
            if viewModel.model.roundResults.count > 0 {
                Text("Current results:")
                    .padding(5)
                ForEach(0..<viewModel.model.roundResults.count, id: \.self) { roundIndex in
                    let roundWinner = viewModel.model.roundResults[roundIndex]
                    if roundWinner != 0 {
                        Text("Round \(roundIndex + 1) winner: Player \(roundWinner)")
                            .padding(2)
                    }
                    else {
                        Text("Round \(roundIndex + 1) winner: -")
                            .padding(2)
                    }
                }
            }
            
//            Spacer()
            
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
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
    
    var resultDisplay: some View {
        return VStack {
            Text("Results")
                .font(.title2)
                .padding(5)
            
            Text("Game Winner: Player \(viewModel.model.gameWinner)")
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
            }
            
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
