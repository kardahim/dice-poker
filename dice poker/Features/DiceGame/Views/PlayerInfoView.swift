//
//  PlayerInfoView.swift
//  dice poker
//

import SwiftUI

struct PlayerInfoView: View {
    @ObservedObject var viewModel: DiceGameViewModel
    @Binding var percentPlayer1: Int
    @Binding var percentPlayer2: Int
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("Player 1 ")
                        .fontWeight(.bold)
                    ScoreCircleView(percent: Int(percentPlayer1), isFirstPlayer: true)
                        .frame(width: 30, height: 30)
                }
                
                if(!viewModel.model.isGameOver) {
                    HStack {
                        ForEach(viewModel.model.player1.dice, id: \.self) { dice in
                            Image("dice_\(dice.value)")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .background(Color.white)
                        }
                    }
                }
                
                if(!viewModel.model.isGameOver) {
                    Text("\(combinationLabel(for: DiceCombinationHelper.determineDiceSetCombination(for: viewModel.model.player1.dice).rawValue))")
                        .padding(1)
                        .font(.system(size: 14))
                }
            }
            
            Spacer()
            
            VStack {
                HStack {
                    ScoreCircleView(percent: Int(percentPlayer2), isFirstPlayer: false)
                        .frame(width: 30, height: 30)
                    Text(" Player 2")
                        .fontWeight(.bold)
                }
                
                if(!viewModel.model.isGameOver) {
                    HStack {
                        ForEach(viewModel.model.player2.dice, id: \.self) { dice in
                            Image("dice_\(dice.value)")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .background(Color.white)
                        }
                    }
                }
                
                if(!viewModel.model.isGameOver) {
                    Text("\(combinationLabel(for: DiceCombinationHelper.determineDiceSetCombination(for: viewModel.model.player2.dice).rawValue))")
                        .padding(1)
                        .font(.system(size: 14))
                }
            }
        }
        .padding(.horizontal, 30)
    }
}
