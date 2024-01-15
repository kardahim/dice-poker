//
//  DiceGameView.swift
//  dice poker
//

import SwiftUI

struct DiceGameView: View {
    @ObservedObject var viewModel: DiceGameViewModel
    @State var rollButtonText: String = "Accept all dice"
    @State var showDetailedResults: Bool = false
    @State private var percentPlayer1: Int = 100
    @State private var percentPlayer2: Int = 100

    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    // MARK: Title with dice icons
                    GameHeaderView()
                    
                    Divider()
                        .frame(maxWidth: .infinity, maxHeight: 1)
                        .background(Color.gray)
                        .padding(.top, -8)
                    
                    // MARK: Current players' `health` points indicators with their current dice sets and corresponding combination names
                    PlayerInfoView(
                        viewModel: viewModel,
                        percentPlayer1: $percentPlayer1,
                        percentPlayer2: $percentPlayer2
                    )
                    
                    if !viewModel.model.isGameOver {
                        if !viewModel.model.isRoundOver {
                            // MARK: Main game part    - roll, reroll, finish turn
                            GameDisplayView(
                                viewModel: viewModel,
                                rollButtonText: $rollButtonText,
                                showDetailedResults: $showDetailedResults,
                                percentPlayer1: $percentPlayer1,
                                percentPlayer2: $percentPlayer2
                            )
                        }
                        else {
                            // MARK: Results for current (and previous) round
                            RoundResultsView(
                                viewModel: viewModel,
                                rollButtonText: $rollButtonText,
                                showDetailedResults: $showDetailedResults,
                                percentPlayer1: $percentPlayer1,
                                percentPlayer2: $percentPlayer2
                            )
                        }
                    }
                    else {
                        ScrollView {
                            // MARK: Finished game details - with history
                            GameResultsView(
                                viewModel: viewModel,
                                rollButtonText: $rollButtonText,
                                showDetailedResults: $showDetailedResults,
                                percentPlayer1: $percentPlayer1,
                                percentPlayer2: $percentPlayer2
                            )
                        }
                    }
                }
                .padding(.top, -38)
                .toolbar {
                    // hand's ranking
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: RankingOfHands()) {
                            Image(systemName: "dice.fill")
                                .resizable()
                                .frame(width: 18, height: 18)
                        }.padding(.top, 30)
                        
                    }
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color.gray.opacity(1), lineWidth: 1)
            )
    }
}
