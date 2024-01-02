//
//  DiceCombination.swift
//  dice poker
//

import Foundation

//enum DiceCombination: Int {
//    case none = 0
//    case onePair = 1
//    case twoPairs = 2
//    case threeOfAKind = 3
//    case smallStraight = 4
//    case largeStraight = 5
//    case fullHouse = 6
//    case fourOfAKind = 7
//    case poker = 8
//
//
//
//}

enum DiceCombination: Int {
    case none = 0
    case onePair_One = 1
    case onePair_Two = 2
    case onePair_Three = 3
    case onePair_Four = 4
    case onePair_Five = 5
    case onePair_Six = 6
    case twoPairs_One_Two = 7
    case twoPairs_One_Three = 8
    case twoPairs_One_Four = 9
    case twoPairs_One_Five = 10
    case twoPairs_One_Six = 11
    case twoPairs_Two_Three = 12
    case twoPairs_Two_Four = 13
    case twoPairs_Two_Five = 14
    case twoPairs_Two_Six = 15
    case twoPairs_Three_Four = 16
    case twoPairs_Three_Five = 17
    case twoPairs_Three_Six = 18
    case twoPairs_Four_Five = 19
    case twoPairs_Four_Six = 20
    case twoPairs_Five_Six = 21
    case threeOfAKind_One = 22
    case threeOfAKind_Two = 23
    case threeOfAKind_Three = 24
    case threeOfAKind_Four = 25
    case threeOfAKind_Five = 26
    case threeOfAKind_Six = 27
    case smallStraight = 28
    case largeStraight = 29
    case fullHouse = 30
    case fourOfAKind_One = 31
    case fourOfAKind_Two = 32
    case fourOfAKind_Three = 33
    case fourOfAKind_Four = 34
    case fourOfAKind_Five = 35
    case fourOfAKind_Six = 36
    case poker = 37
}

// Funkcja mapująca wartość liczbową na etykietę tekstową
//func combinationLabel(for value: Int) -> String {
//    guard let combination = DiceCombination(rawValue: value) else {
//        return ""
//    }
//
//    switch combination {
////    case .none:
////        return "None"
//    case .onePair:
//        return "One Pair"
//    case .twoPairs:
//        return "Two Pairs"
//    case .threeOfAKind:
//        return "Three of a Kind"
//    case .smallStraight:
//        return "Small Straight"
//    case .largeStraight:
//        return "Large Straight"
//    case .fullHouse:
//        return "Full House"
//    case .fourOfAKind:
//        return "Four of a Kind"
//    case .poker:
//        return "Poker"
//    default:
//        return "None"
//    }
//}

func combinationLabel(for value: Int) -> String {
    guard let combination = DiceCombination(rawValue: value) else {
        return ""
    }

    switch combination {
    case .none:
        return "None"
    case .onePair_One:
        return "One Pair (1)"
    case .onePair_Two:
        return "One Pair (2)"
    case .onePair_Three:
        return "One Pair (3)"
    case .onePair_Four:
        return "One Pair (4)"
    case .onePair_Five:
        return "One Pair (5)"
    case .onePair_Six:
        return "One Pair (6)"
    case .twoPairs_One_Two:
        return "Two Pairs (1, 2)"
    case .twoPairs_One_Three:
        return "Two Pairs (1, 3)"
    case .twoPairs_One_Four:
        return "Two Pairs (1, 4)"
    case .twoPairs_One_Five:
        return "Two Pairs (1, 5)"
    case .twoPairs_One_Six:
        return "Two Pairs (1, 6)"
    case .twoPairs_Two_Three:
        return "Two Pairs (2, 3)"
    case .twoPairs_Two_Four:
        return "Two Pairs (2, 4)"
    case .twoPairs_Two_Five:
        return "Two Pairs (2, 5)"
    case .twoPairs_Two_Six:
        return "Two Pairs (2, 6)"
    case .twoPairs_Three_Four:
        return "Two Pairs (3, 4)"
    case .twoPairs_Three_Five:
        return "Two Pairs (3, 5)"
    case .twoPairs_Three_Six:
        return "Two Pairs (3, 6)"
    case .twoPairs_Four_Five:
        return "Two Pairs (4, 5)"
    case .twoPairs_Four_Six:
        return "Two Pairs (4, 6)"
    case .twoPairs_Five_Six:
        return "Two Pairs (5, 6)"
    case .threeOfAKind_One:
        return "Three of a Kind (1)"
    case .threeOfAKind_Two:
        return "Three of a Kind (2)"
    case .threeOfAKind_Three:
        return "Three of a Kind (3)"
    case .threeOfAKind_Four:
        return "Three of a Kind (4)"
    case .threeOfAKind_Five:
        return "Three of a Kind (5)"
    case .threeOfAKind_Six:
        return "Three of a Kind (6)"
    case .smallStraight:
        return "Small Straight"
    case .largeStraight:
        return "Large Straight"
    case .fullHouse:
        return "Full House"
    case .fourOfAKind_One:
        return "Four of a Kind (1)"
    case .fourOfAKind_Two:
        return "Four of a Kind (2)"
    case .fourOfAKind_Three:
        return "Four of a Kind (3)"
    case .fourOfAKind_Four:
        return "Four of a Kind (4)"
    case .fourOfAKind_Five:
        return "Four of a Kind (5)"
    case .fourOfAKind_Six:
        return "Four of a Kind (6)"
    case .poker:
        return "Poker"
    }
}

