//
//  DiceView.swift
//  dice poker
//

import SwiftUI

struct DiceView: View {
    var dice: Dice

    var body: some View {
        Image("dice_\(dice.value)")
            .resizable()
            .frame(width: 50, height: 50)
            .rotationEffect(.degrees(dice.isChosen ? 135 : 0))
            .animation(.easeInOut)
    }
}

//struct DiceView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiceView()
//    }
//}
