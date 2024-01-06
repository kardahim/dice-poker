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
                    Text("None - 5 mismatched dice without any sequence")
                    Text("One Pair - 1 pair have the same value")
                    Text("Two Pairs - 2 pairs of dice, each have the same value")
                    Text("Three of a Kind - 3 dice have the same value")
                    Text("Small Straight - dice values from 1 through 5 inclusive")
                    Text("Large Straight - dice values from 2 through 6 inclusive")
                    Text("Full House - pair and three of a kind ")
                    Text("Four of a Kind - 4 dice have the same value")
                    Text("Five of a Kind - 5 dice have the same value")
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
