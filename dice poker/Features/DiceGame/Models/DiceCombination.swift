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

    case fullHouse_Two_One = 30
    case fullHouse_Three_One = 31
    case fullHouse_Four_One = 32
    case fullHouse_Five_One = 33
    case fullHouse_Six_One = 34
    case fullHouse_One_Two = 35
    case fullHouse_Three_Two = 36
    case fullHouse_Four_Two = 37
    case fullHouse_Five_Two = 38
    case fullHouse_Six_Two = 39
    case fullHouse_One_Three = 40
    case fullHouse_Two_Three = 41
    case fullHouse_Four_Three = 42
    case fullHouse_Five_Three = 43
    case fullHouse_Six_Three = 44
    case fullHouse_One_Four = 45
    case fullHouse_Two_Four = 46
    case fullHouse_Three_Four = 47
    case fullHouse_Five_Four = 48
    case fullHouse_Six_Four = 49
    case fullHouse_One_Five = 50
    case fullHouse_Two_Five = 51
    case fullHouse_Three_Five = 52
    case fullHouse_Four_Five = 53
    case fullHouse_Six_Five = 54
    case fullHouse_One_Six = 55
    case fullHouse_Two_Six = 56
    case fullHouse_Three_Six = 57
    case fullHouse_Four_Six = 58
    case fullHouse_Five_Six = 59
    
    case fourOfAKind_One = 60
    case fourOfAKind_Two = 61
    case fourOfAKind_Three = 62
    case fourOfAKind_Four = 63
    case fourOfAKind_Five = 64
    case fourOfAKind_Six = 65
    
    case fiveOfAKind_One = 66
    case fiveOfAKind_Two = 67
    case fiveOfAKind_Three = 68
    case fiveOfAKind_Four = 69
    case fiveOfAKind_Five = 70
    case fiveOfAKind_Six = 71
}

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
        case .fullHouse_One_Two:
            return "Full House (1, 2)"
        case .fullHouse_One_Three:
            return "Full House (1, 3)"
        case .fullHouse_One_Four:
            return "Full House (1, 4)"
        case .fullHouse_One_Five:
            return "Full House (1, 5)"
        case .fullHouse_One_Six:
            return "Full House (1, 6)"
        case .fullHouse_Two_One:
            return "Full House (2, 1)"
        case .fullHouse_Two_Three:
            return "Full House (2, 3)"
        case .fullHouse_Two_Four:
            return "Full House (2, 4)"
        case .fullHouse_Two_Five:
            return "Full House (2, 5)"
        case .fullHouse_Two_Six:
            return "Full House (2, 6)"
        case .fullHouse_Three_One:
            return "Full House (3, 1)"
        case .fullHouse_Three_Two:
            return "Full House (3, 2)"
        case .fullHouse_Three_Four:
            return "Full House (3, 4)"
        case .fullHouse_Three_Five:
            return "Full House (3, 5)"
        case .fullHouse_Three_Six:
            return "Full House (3, 6)"
        case .fullHouse_Four_One:
            return "Full House (4, 1)"
        case .fullHouse_Four_Two:
            return "Full House (4, 2)"
        case .fullHouse_Four_Three:
            return "Full House (4, 3)"
        case .fullHouse_Four_Five:
            return "Full House (4, 5)"
        case .fullHouse_Four_Six:
            return "Full House (4, 6)"
        case .fullHouse_Five_One:
            return "Full House (5, 1)"
        case .fullHouse_Five_Two:
            return "Full House (5, 2)"
        case .fullHouse_Five_Three:
            return "Full House (5, 3)"
        case .fullHouse_Five_Four:
            return "Full House (5, 4)"
        case .fullHouse_Five_Six:
            return "Full House (5, 6)"
        case .fullHouse_Six_One:
            return "Full House (6, 1)"
        case .fullHouse_Six_Two:
            return "Full House (6, 2)"
        case .fullHouse_Six_Three:
            return "Full House (6, 3)"
        case .fullHouse_Six_Four:
            return "Full House (6, 4)"
        case .fullHouse_Six_Five:
            return "Full House (6, 5)"
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
        case .fiveOfAKind_One:
            return "Five of a Kind (1)"
        case .fiveOfAKind_Two:
            return "Five of a Kind (2)"
        case .fiveOfAKind_Three:
            return "Five of a Kind (3)"
        case .fiveOfAKind_Four:
            return "Five of a Kind (4)"
        case .fiveOfAKind_Five:
            return "Five of a Kind (5)"
        case .fiveOfAKind_Six:
            return "Five of a Kind (6)"
    }
    
}

