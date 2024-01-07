//
//  DiceCombinationHelperTests.swift
//  dice pokerTests
//

import XCTest
@testable import dice_poker

final class DiceCombinationHelperTests: XCTestCase {
    
    static let diceSet_none = DiceCombinationHelper.createDiceArray(from: [1,6,2,5,3])
    static let diceSet_onePair_One = DiceCombinationHelper.createDiceArray(from: [1,1,2,3,4])
    static let diceSet_onePair_Two = DiceCombinationHelper.createDiceArray(from: [1,2,2,3,4])
    static let diceSet_onePair_Three = DiceCombinationHelper.createDiceArray(from: [6,5,3,3,4])
    static let diceSet_onePair_Four = DiceCombinationHelper.createDiceArray(from: [4,1,2,3,4])
    static let diceSet_onePair_Five = DiceCombinationHelper.createDiceArray(from: [5,2,5,3,4])
    static let diceSet_onePair_Six = DiceCombinationHelper.createDiceArray(from: [5,1,6,3,6])
    static let diceSet_twoPairs_One_Two = DiceCombinationHelper.createDiceArray(from: [2,1,6,2,1])
    static let diceSet_twoPairs_One_Three = DiceCombinationHelper.createDiceArray(from: [3,1,6,3,1])
    static let diceSet_twoPairs_One_Four = DiceCombinationHelper.createDiceArray(from: [4,1,6,4,1])
    static let diceSet_twoPairs_One_Five = DiceCombinationHelper.createDiceArray(from: [5,1,6,5,1])
    static let diceSet_twoPairs_One_Six = DiceCombinationHelper.createDiceArray(from: [2,1,6,6,1])
    static let diceSet_twoPairs_Two_Three = DiceCombinationHelper.createDiceArray(from: [2,3,6,2,3])
    static let diceSet_twoPairs_Two_Four = DiceCombinationHelper.createDiceArray(from: [2,4,6,2,4])
    static let diceSet_twoPairs_Two_Five = DiceCombinationHelper.createDiceArray(from: [2,5,6,2,5])
    static let diceSet_twoPairs_Two_Six = DiceCombinationHelper.createDiceArray(from: [2,6,4,2,6])
    static let diceSet_twoPairs_Three_Four = DiceCombinationHelper.createDiceArray(from: [3,6,4,4,3])
    static let diceSet_twoPairs_Three_Five = DiceCombinationHelper.createDiceArray(from: [3,5,4,3,5])
    static let diceSet_twoPairs_Three_Six = DiceCombinationHelper.createDiceArray(from: [3,6,3,2,6])
    static let diceSet_twoPairs_Four_Five = DiceCombinationHelper.createDiceArray(from: [2,5,4,5,4])
    static let diceSet_twoPairs_Four_Six = DiceCombinationHelper.createDiceArray(from: [6,6,4,2,4])
    static let diceSet_twoPairs_Five_Six = DiceCombinationHelper.createDiceArray(from: [5,6,5,2,6])
    static let diceSet_threeOfAKind_One = DiceCombinationHelper.createDiceArray(from: [1,6,5,1,1])
    static let diceSet_threeOfAKind_Two = DiceCombinationHelper.createDiceArray(from: [2,6,5,2,2])
    static let diceSet_threeOfAKind_Three = DiceCombinationHelper.createDiceArray(from: [3,6,5,3,3])
    static let diceSet_threeOfAKind_Four = DiceCombinationHelper.createDiceArray(from: [4,3,5,4,4])
    static let diceSet_threeOfAKind_Five = DiceCombinationHelper.createDiceArray(from: [5,6,5,1,5])
    static let diceSet_threeOfAKind_Six = DiceCombinationHelper.createDiceArray(from: [6,6,5,1,6])
    static let diceSet_smallStraight = DiceCombinationHelper.createDiceArray(from: [4,3,5,1,2])
    static let diceSet_largeStraight = DiceCombinationHelper.createDiceArray(from: [6,3,5,2,4])
    static let diceSet_fullHouse_Two_One = DiceCombinationHelper.createDiceArray(from: [2,2,1,1,1])
    static let diceSet_fullHouse_Three_One = DiceCombinationHelper.createDiceArray(from: [3,3,1,1,1])
    static let diceSet_fullHouse_Four_One = DiceCombinationHelper.createDiceArray(from: [4,4,1,1,1])
    static let diceSet_fullHouse_Five_One = DiceCombinationHelper.createDiceArray(from: [5,5,1,1,1])
    static let diceSet_fullHouse_Six_One = DiceCombinationHelper.createDiceArray(from: [6,6,1,1,1])
    static let diceSet_fullHouse_One_Two = DiceCombinationHelper.createDiceArray(from: [1,1,2,2,2])
    static let diceSet_fullHouse_Three_Two = DiceCombinationHelper.createDiceArray(from: [2,2,2,3,3])
    static let diceSet_fullHouse_Four_Two = DiceCombinationHelper.createDiceArray(from: [2,2,2,4,4])
    static let diceSet_fullHouse_Five_Two = DiceCombinationHelper.createDiceArray(from: [2,2,2,5,5])
    static let diceSet_fullHouse_Six_Two = DiceCombinationHelper.createDiceArray(from: [2,2,2,6,6])
    static let diceSet_fullHouse_One_Three = DiceCombinationHelper.createDiceArray(from: [3,3,3,1,1])
    static let diceSet_fullHouse_Two_Three = DiceCombinationHelper.createDiceArray(from: [2,2,3,3,3])
    static let diceSet_fullHouse_Four_Three = DiceCombinationHelper.createDiceArray(from: [4,4,3,3,3])
    static let diceSet_fullHouse_Five_Three = DiceCombinationHelper.createDiceArray(from: [5,5,3,3,3])
    static let diceSet_fullHouse_Six_Three = DiceCombinationHelper.createDiceArray(from: [6,6,3,3,3])
    static let diceSet_fullHouse_One_Four = DiceCombinationHelper.createDiceArray(from: [1,1,4,4,4])
    static let diceSet_fullHouse_Two_Four = DiceCombinationHelper.createDiceArray(from: [2,2,4,4,4])
    static let diceSet_fullHouse_Three_Four = DiceCombinationHelper.createDiceArray(from: [3,3,4,4,4])
    static let diceSet_fullHouse_Five_Four = DiceCombinationHelper.createDiceArray(from: [5,5,4,4,4])
    static let diceSet_fullHouse_Six_Four = DiceCombinationHelper.createDiceArray(from: [6,6,4,4,4])
    static let diceSet_fullHouse_One_Five = DiceCombinationHelper.createDiceArray(from: [1,1,5,5,5])
    static let diceSet_fullHouse_Two_Five = DiceCombinationHelper.createDiceArray(from: [2,2,5,5,5])
    static let diceSet_fullHouse_Three_Five = DiceCombinationHelper.createDiceArray(from: [3,3,5,5,5])
    static let diceSet_fullHouse_Four_Five = DiceCombinationHelper.createDiceArray(from: [4,4,5,5,5])
    static let diceSet_fullHouse_Six_Five = DiceCombinationHelper.createDiceArray(from: [6,6,5,5,5])
    static let diceSet_fullHouse_One_Six = DiceCombinationHelper.createDiceArray(from: [1,1,6,6,6])
    static let diceSet_fullHouse_Two_Six = DiceCombinationHelper.createDiceArray(from: [2,2,6,6,6])
    static let diceSet_fullHouse_Three_Six = DiceCombinationHelper.createDiceArray(from: [3,3,6,6,6])
    static let diceSet_fullHouse_Four_Six = DiceCombinationHelper.createDiceArray(from: [4,4,6,6,6])
    static let diceSet_fullHouse_Five_Six = DiceCombinationHelper.createDiceArray(from: [5,5,6,6,6])
    static let diceSet_fourOfAKind_One = DiceCombinationHelper.createDiceArray(from: [1,1,1,1,2])
    static let diceSet_fourOfAKind_Two = DiceCombinationHelper.createDiceArray(from: [2,2,2,2,3])
    static let diceSet_fourOfAKind_Three = DiceCombinationHelper.createDiceArray(from: [3,3,3,3,4])
    static let diceSet_fourOfAKind_Four = DiceCombinationHelper.createDiceArray(from: [4,4,4,4,5])
    static let diceSet_fourOfAKind_Five = DiceCombinationHelper.createDiceArray(from: [5,5,5,5,3])
    static let diceSet_fourOfAKind_Six = DiceCombinationHelper.createDiceArray(from: [6,6,6,6,2])
    static let diceSet_fiveOfAKind_One = DiceCombinationHelper.createDiceArray(from: [1,1,1,1,1])
    static let diceSet_fiveOfAKind_Two = DiceCombinationHelper.createDiceArray(from: [2,2,2,2,2])
    static let diceSet_fiveOfAKind_Three = DiceCombinationHelper.createDiceArray(from: [3,3,3,3,3])
    static let diceSet_fiveOfAKind_Four = DiceCombinationHelper.createDiceArray(from: [4,4,4,4,4])
    static let diceSet_fiveOfAKind_Five = DiceCombinationHelper.createDiceArray(from: [5,5,5,5,5])
    static let diceSet_fiveOfAKind_Six = DiceCombinationHelper.createDiceArray(from: [6,6,6,6,6])
    
    
    func testDetermineDiceSetCombination_none() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_none), .none)
    }
    
    func testDetermineDiceSetCombination_onePair_One() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_onePair_One), .onePair_One)
    }
    
    func testDetermineDiceSetCombination_onePair_Two() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_onePair_Two), .onePair_Two)
    }
    
    func testDetermineDiceSetCombination_onePair_Three() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_onePair_Three), .onePair_Three)
    }
    
    func testDetermineDiceSetCombination_onePair_Four() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_onePair_Four), .onePair_Four)
    }
    
    func testDetermineDiceSetCombination_onePair_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_onePair_Five), .onePair_Five)
    }
    
    func testDetermineDiceSetCombination_onePair_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_onePair_Six), .onePair_Six)
    }
    
    func testDetermineDiceSetCombination_twoPairs_One_Two() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_One_Two), .twoPairs_One_Two)
    }
    
    func testDetermineDiceSetCombination_twoPairs_One_Three() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_One_Three), .twoPairs_One_Three)
    }
    
    func testDetermineDiceSetCombination_twoPairs_One_Four() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_One_Four), .twoPairs_One_Four)
    }
    
    func testDetermineDiceSetCombination_twoPairs_One_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_One_Five), .twoPairs_One_Five)
    }
    
    func testDetermineDiceSetCombination_twoPairs_One_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_One_Six), .twoPairs_One_Six)
    }
    
    func testDetermineDiceSetCombination_twoPairs_Two_Three() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_Two_Three), .twoPairs_Two_Three)
    }
    
    func testDetermineDiceSetCombination_twoPairs_Two_Four() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_Two_Four), .twoPairs_Two_Four)
    }
    
    func testDetermineDiceSetCombination_twoPairs_Two_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_Two_Five), .twoPairs_Two_Five)
    }
    
    func testDetermineDiceSetCombination_twoPairs_Two_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_Two_Six), .twoPairs_Two_Six)
    }
    
    func testDetermineDiceSetCombination_twoPairs_Three_Four() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_Three_Four), .twoPairs_Three_Four)
    }
    
    func testDetermineDiceSetCombination_twoPairs_Three_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_Three_Five), .twoPairs_Three_Five)
    }
    
    func testDetermineDiceSetCombination_twoPairs_Three_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_Three_Six), .twoPairs_Three_Six)
    }
    
    func testDetermineDiceSetCombination_twoPairs_Four_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_Four_Five), .twoPairs_Four_Five)
    }
    
    func testDetermineDiceSetCombination_twoPairs_Four_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_Four_Six), .twoPairs_Four_Six)
    }
    
    func testDetermineDiceSetCombination_twoPairs_Five_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_twoPairs_Five_Six), .twoPairs_Five_Six)
    }

    func testDetermineDiceSetCombination_threeOfAKind_One() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_threeOfAKind_One), .threeOfAKind_One)
    }

    func testDetermineDiceSetCombination_threeOfAKind_Two() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_threeOfAKind_Two), .threeOfAKind_Two)
    }
    
    func testDetermineDiceSetCombination_threeOfAKind_Three() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_threeOfAKind_Three), .threeOfAKind_Three)
    }
    
    func testDetermineDiceSetCombination_threeOfAKind_Four() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_threeOfAKind_Four), .threeOfAKind_Four)
    }
    
    func testDetermineDiceSetCombination_threeOfAKind_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_threeOfAKind_Five), .threeOfAKind_Five)
    }
    
    func testDetermineDiceSetCombination_threeOfAKind_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_threeOfAKind_Six), .threeOfAKind_Six)
    }

    func testDetermineDiceSetCombination_smallStraight() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_smallStraight), .smallStraight)
    }
    
    func testDetermineDiceSetCombination_largeStraight() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_largeStraight), .largeStraight)
    }

    func testDetermineDiceSetCombination_fullHouse_Two_One() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Two_One), .fullHouse_Two_One)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Three_One() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Three_One), .fullHouse_Three_One)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Four_One() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Four_One), .fullHouse_Four_One)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Five_One() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Five_One), .fullHouse_Five_One)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Six_One() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Six_One), .fullHouse_Six_One)
    }
    
    func testDetermineDiceSetCombination_fullHouse_One_Two() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_One_Two), .fullHouse_One_Two)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Three_Two() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Three_Two), .fullHouse_Three_Two)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Four_Two() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Four_Two), .fullHouse_Four_Two)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Five_Two() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Five_Two), .fullHouse_Five_Two)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Six_Two() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Six_Two), .fullHouse_Six_Two)
    }
    
    func testDetermineDiceSetCombination_fullHouse_One_Three() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_One_Three), .fullHouse_One_Three)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Two_Three() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Two_Three), .fullHouse_Two_Three)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Four_Three() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Four_Three), .fullHouse_Four_Three)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Five_Three() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Five_Three), .fullHouse_Five_Three)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Six_Three() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Six_Three), .fullHouse_Six_Three)
    }
    
    func testDetermineDiceSetCombination_fullHouse_One_Four() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_One_Four), .fullHouse_One_Four)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Two_Four() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Two_Four), .fullHouse_Two_Four)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Three_Four() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Three_Four), .fullHouse_Three_Four)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Five_Four() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Five_Four), .fullHouse_Five_Four)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Six_Four() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Six_Four), .fullHouse_Six_Four)
    }
    
    func testDetermineDiceSetCombination_fullHouse_One_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_One_Five), .fullHouse_One_Five)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Two_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Two_Five), .fullHouse_Two_Five)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Three_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Three_Five), .fullHouse_Three_Five)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Four_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Four_Five), .fullHouse_Four_Five)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Six_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Six_Five), .fullHouse_Six_Five)
    }
    
    func testDetermineDiceSetCombination_fullHouse_One_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_One_Six), .fullHouse_One_Six)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Two_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Two_Six), .fullHouse_Two_Six)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Three_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Three_Six), .fullHouse_Three_Six)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Four_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Four_Six), .fullHouse_Four_Six)
    }
    
    func testDetermineDiceSetCombination_fullHouse_Five_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fullHouse_Five_Six), .fullHouse_Five_Six)
    }

    func testDetermineDiceSetCombination_fourOfAKind_One() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fourOfAKind_One), .fourOfAKind_One)
    }
    
    func testDetermineDiceSetCombination_fourOfAKind_Two() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fourOfAKind_Two), .fourOfAKind_Two)
    }
    
    func testDetermineDiceSetCombination_fourOfAKind_Three() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fourOfAKind_Three), .fourOfAKind_Three)
    }
    
    func testDetermineDiceSetCombination_fourOfAKind_Four() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fourOfAKind_Four), .fourOfAKind_Four)
    }
    
    func testDetermineDiceSetCombination_fourOfAKind_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fourOfAKind_Five), .fourOfAKind_Five)
    }
    
    func testDetermineDiceSetCombination_fourOfAKind_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fourOfAKind_Six), .fourOfAKind_Six)
    }

    func testDetermineDiceSetCombination_fiveOfAKind_One() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fiveOfAKind_One), .fiveOfAKind_One)
    }
    
    func testDetermineDiceSetCombination_fiveOfAKind_Two() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fiveOfAKind_Two), .fiveOfAKind_Two)
    }
    
    func testDetermineDiceSetCombination_fiveOfAKind_Three() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fiveOfAKind_Three), .fiveOfAKind_Three)
    }
    
    func testDetermineDiceSetCombination_fiveOfAKind_Four() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fiveOfAKind_Four), .fiveOfAKind_Four)
    }
    
    func testDetermineDiceSetCombination_fiveOfAKind_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fiveOfAKind_Five), .fiveOfAKind_Five)
    }
    
    func testDetermineDiceSetCombination_fiveOfAKind_Six() {
        XCTAssertEqual(DiceCombinationHelper.determineDiceSetCombination(for: Self.diceSet_fiveOfAKind_Six), .fiveOfAKind_Six)
    }
    
    func testDetermineRoundWinner_fiveOfAKind_Six_vs_fiveOfAKind_Five() {
        XCTAssertEqual(DiceCombinationHelper.determineWinningDiceSet(
            diceSet1: Self.diceSet_fiveOfAKind_Six,
            diceSet2: Self.diceSet_fiveOfAKind_Five), 1)
    }
    
}
