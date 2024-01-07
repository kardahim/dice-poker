//
//  RankingOfHands.swift
//  dice poker
//

import SwiftUI

struct RankingOfHands: View {
    var body: some View {
        VStack {
            List {
                Section(
                    header:
                        VStack{
                            Text("Ranking of Hands").font(.title).padding(.horizontal)
                            Text("From the lowest to the highest")
                        },
                    footer:
                        Text("In the case of the same dice arrangement for both players at the same time, higher dice values win")
                ) {
                    Text("None")
                        .font(.title3)
                        .fontWeight(.bold) +
                        Text(" - 5 mismatched dice without any sequence")
                    Text("One Pair")
                        .font(.title3)
                        .fontWeight(.bold) +
                        Text(" - 1 ") +
                        Text("Pair")
                            .fontWeight(.bold) +
                        Text(" have the same value")
                    Text("Two Pairs")
                        .font(.title3)
                        .fontWeight(.bold) +
                        Text(" - 2 ") +
                        Text("Pairs")
                            .fontWeight(.bold) +
                        Text(" of dice, each have the same value")
                    Text("Three of a Kind")
                        .font(.title3)
                        .fontWeight(.bold) +
                        Text(" - 3 dice have the same value")
                    Text("Small Straight")
                        .font(.title3)
                        .fontWeight(.bold) +
                        Text(" - dice values from 1 through 5 inclusive")
                    Text("Large Straight")
                        .font(.title3)
                        .fontWeight(.bold) +
                        Text(" - dice values from 2 through 6 inclusive")
                    Text("Full House")
                        .font(.title3)
                        .fontWeight(.bold) +
                        Text(" - one ") +
                        Text("Pair")
                            .fontWeight(.bold) +
                            Text(" and ") +
                            Text("Three of a Kind")
                                .fontWeight(.bold)
                    Text("Four of a Kind")
                        .font(.title3)
                        .fontWeight(.bold) +
                        Text(" - 4 dice have the same value")
                    Text("Five of a Kind")
                        .font(.title3)
                        .fontWeight(.bold) +
                        Text(" - 5 dice have the same value")
                }
            }
        }
    }
}

struct RankingOfHands_Previews: PreviewProvider {
    static var previews: some View {
        RankingOfHands()
    }
}
