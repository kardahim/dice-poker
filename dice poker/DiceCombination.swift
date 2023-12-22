//
//  DiceCombination.swift
//  dice poker
//

import Foundation

enum DiceCombination: Int {
    case none = 0
    case onePair = 1
    case twoPairs = 2
    case threeOfAKind = 3
    case smallStraight = 4
    case largeStraight = 5
    case fullHouse = 6
    case fourOfAKind = 7
    case poker = 8
    
    
    
}

// Funkcja mapująca wartość liczbową na etykietę tekstową
func combinationLabel(for value: Int) -> String {
    guard let combination = DiceCombination(rawValue: value) else {
        return ""
    }

    switch combination {
//    case .none:
//        return "None"
    case .onePair:
        return "One Pair"
    case .twoPairs:
        return "Two Pairs"
    case .threeOfAKind:
        return "Three of a Kind"
    case .smallStraight:
        return "Small Straight"
    case .largeStraight:
        return "Large Straight"
    case .fullHouse:
        return "Full House"
    case .fourOfAKind:
        return "Four of a Kind"
    case .poker:
        return "Poker"
    default:
        return "None"
    }
}
