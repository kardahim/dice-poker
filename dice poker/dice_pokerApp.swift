//
//  dice_pokerApp.swift
//  dice poker
//

import SwiftUI

@main
struct dice_pokerApp: App {
    @StateObject private var diceGameViewModel = DiceGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            DiceGameView(viewModel: diceGameViewModel)
        }
    }
}
