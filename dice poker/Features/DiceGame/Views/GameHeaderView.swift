//
//  GameHeaderView.swift
//  dice poker
//

import SwiftUI

struct GameHeaderView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).edgesIgnoringSafeArea(.all)
                .frame(maxHeight: 60)
            
            VStack{
                HStack {
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
                .frame(maxHeight: 44)
            }
        }
    }
}
