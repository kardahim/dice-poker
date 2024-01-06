//
//  DiceCombinationHelper.swift
//  dice poker
//

import Foundation


class DiceCombinationHelper {
    static func evaluateRoll(for dice: [Dice]) -> DiceCombination {
        let sortedValues = dice.map { $0.value }.sorted()

        func hasTwoPairs() -> Bool {
            var pairCount = 0
            var index = 0
            while index < sortedValues.count - 1 {
                if sortedValues[index] == sortedValues[index + 1] {
                    pairCount += 1
                    index += 2
                } else {
                    index += 1
                }
            }
            return pairCount == 2
        }

        func hasThreeOfAKind() -> Bool {
            var index = 0
            while index < sortedValues.count - 2 {
                if sortedValues[index] == sortedValues[index + 1] && sortedValues[index] == sortedValues[index + 2] {
                    return true
                }
                index += 1
            }
            return false
        }

        func hasSmallStraight() -> Bool {
            let uniqueValues = Array(Set(sortedValues))
            return uniqueValues.count >= 5 && uniqueValues.max()! - uniqueValues.min()! == 4
        }

        func hasLargeStraight() -> Bool {
            return Set(sortedValues).count == 5 && sortedValues.max()! - sortedValues.min()! == 4
        }

        func hasFullHouse() -> Bool {
            return (sortedValues[0] == sortedValues[1] && sortedValues[2] == sortedValues[4]) ||
                   (sortedValues[0] == sortedValues[2] && sortedValues[3] == sortedValues[4])
        }

        func hasFourOfAKind() -> Bool {
            return sortedValues[0] == sortedValues[3] || sortedValues[1] == sortedValues[4]
        }

        func hasFiveOfAKind() -> Bool {
            return sortedValues[0] == sortedValues[4]
        }
        
        func countOccurrences(of value: Int) -> Int {
            return sortedValues.filter { $0 == value }.count
        }
        
        if hasFiveOfAKind() {
//            return .hasFiveOfAKind
            var num = 0
            for value in 1...6 {
                if countOccurrences(of: value) == 5 {
                    num = value
                    break
                }
            }
            switch(num) {
            case 1:
                return .fiveOfAKind_One
            case 2:
                return .fiveOfAKind_Two
            case 3:
                return .fiveOfAKind_Three
            case 4:
                return .fiveOfAKind_Four
            case 5:
                return .fiveOfAKind_Five
            case 6:
                return .fiveOfAKind_Six
            default:
                return .none
            }
        } else if hasFourOfAKind() {
            var num = 0
            for value in 1...6 {
                if countOccurrences(of: value) == 4 {
                    num = value
                    break
                }
            }
            switch(num) {
            case 1:
                return .fourOfAKind_One
            case 2:
                return .fourOfAKind_Two
            case 3:
                return .fourOfAKind_Three
            case 4:
                return .fourOfAKind_Four
            case 5:
                return .fourOfAKind_Five
            case 6:
                return .fourOfAKind_Six
            default:
                return .none
            }
        } else if hasFullHouse() {
//            return .fullHouse
            var pairs: [Int] = []
            var threeOfAKind: Int?

            for value in 1...6 {
                let occurrences = countOccurrences(of: value)
                if occurrences >= 2 {
                    pairs.append(value)
                }
                if occurrences == 3 {
                    threeOfAKind = value
                }
            }

            if let threeOfAKindValue = threeOfAKind {
                switch (pairs.first, threeOfAKindValue) {
                    case (1?, 2):
                        return .fullHouse_One_Two
                    case (1?, 3):
                        return .fullHouse_One_Three
                    case (1?, 4):
                        return .fullHouse_One_Four
                    case (1?, 5):
                        return .fullHouse_One_Five
                    case (1?, 6):
                        return .fullHouse_One_Six
                    case (2?, 1):
                        return .fullHouse_Two_One
                    case (2?, 3):
                        return .fullHouse_Two_Three
                    case (2?, 4):
                        return .fullHouse_Two_Four
                    case (2?, 5):
                        return .fullHouse_Two_Five
                    case (2?, 6):
                        return .fullHouse_Two_Six
                    case (3?, 1):
                        return .fullHouse_Three_One
                    case (3?, 2):
                        return .fullHouse_Three_Two
                    case (3?, 4):
                        return .fullHouse_Three_Four
                    case (3?, 5):
                        return .fullHouse_Three_Five
                    case (3?, 6):
                        return .fullHouse_Three_Six
                    case (4?, 1):
                        return .fullHouse_Four_One
                    case (4?, 2):
                        return .fullHouse_Four_Two
                    case (4?, 3):
                        return .fullHouse_Four_Three
                    case (4?, 5):
                        return .fullHouse_Four_Five
                    case (4?, 6):
                        return .fullHouse_Four_Six
                    case (5?, 1):
                        return .fullHouse_Five_One
                    case (5?, 2):
                        return .fullHouse_Five_Two
                    case (5?, 3):
                        return .fullHouse_Five_Three
                    case (5?, 4):
                        return .fullHouse_Five_Four
                    case (5?, 6):
                        return .fullHouse_Five_Six
                    case (6?, 1):
                        return .fullHouse_Six_One
                    case (6?, 2):
                        return .fullHouse_Six_Two
                    case (6?, 3):
                        return .fullHouse_Six_Three
                    case (6?, 4):
                        return .fullHouse_Six_Four
                    case (6?, 5):
                        return .fullHouse_Six_Five
                    default:
                        return .none
                }
                
            }
            return .none // !
        } else if hasLargeStraight() {
            return .largeStraight
        } else if hasSmallStraight() {
            return .smallStraight
        } else if hasThreeOfAKind() {
            var num = 0
            for value in 1...6 {
                if countOccurrences(of: value) == 3 {
                    num = value
                    break
                }
            }
            switch(num) {
            case 1:
                return .threeOfAKind_One
            case 2:
                return .threeOfAKind_Two
            case 3:
                return .threeOfAKind_Three
            case 4:
                return .threeOfAKind_Four
            case 5:
                return .threeOfAKind_Five
            case 6:
                return .threeOfAKind_Six
            default:
                return .none
            }
        } else if hasTwoPairs() {
            var pairs: [Int] = []

            for value in 1...6 {
                if countOccurrences(of: value) >= 2 {
                    pairs.append(value)
                }
            }

            switch (pairs[0], pairs[1]) {
            case (1, 2):
                return .twoPairs_One_Two
            case (1, 3):
                return .twoPairs_One_Three
            case (1, 4):
                return .twoPairs_One_Four
            case (1, 5):
                return .twoPairs_One_Five
            case (1, 6):
                return .twoPairs_One_Six
            case (2, 3):
                return .twoPairs_Two_Three
            case (2, 4):
                return .twoPairs_Two_Four
            case (2, 5):
                return .twoPairs_Two_Five
            case (2, 6):
                return .twoPairs_Two_Six
            case (3, 4):
                return .twoPairs_Three_Four
            case (3, 5):
                return .twoPairs_Three_Five
            case (3, 6):
                return .twoPairs_Three_Six
            case (4, 5):
                return .twoPairs_Four_Five
            case (4, 6):
                return .twoPairs_Four_Six
            case (5, 6):
                return .twoPairs_Five_Six
            default:
                return .none
            }
        } else if sortedValues[0] == sortedValues[1] || sortedValues[1] == sortedValues[2] ||
                  sortedValues[2] == sortedValues[3] || sortedValues[3] == sortedValues[4] {
            var num = 0
            for value in 1...6 {
                if countOccurrences(of: value) == 2 {
                    num = value
                    break
                }
            }
            switch(num) {
            case 1:
                return .onePair_One
            case 2:
                return .onePair_Two
            case 3:
                return .onePair_Three
            case 4:
                return .onePair_Four
            case 5:
                return .onePair_Five
            case 6:
                return .onePair_Six
            default:
                return .none
            }
        } else {
            return .none
        }
    }
}
