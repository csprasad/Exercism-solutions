import Foundation

//Card
struct Card {
    let value: Int
    let suit: Character
    
    init?(_ string: String.SubSequence) {
        guard let suit = string.last, "♤♡♢♧".contains(suit),
              let value = PokerHand.cardValue[String(string.dropLast())] else {
            return nil
        }
        self.value = value
        self.suit = suit
    }
}

//HandValidator
struct HandValidator {
    static func validate(_ hand: String) -> [Card]? {
        let cards = hand.split(separator: " ").map { Card($0) }
        guard cards.count == 5, cards.allSatisfy({ $0 != nil }),
              Set(cards.map { "\($0!.value)\($0!.suit)" }).count == 5 else {
            return nil
        }
        return cards.map { $0! }
    }
}

//HandEvaluator
struct HandEvaluator {
    typealias HandCounts = [(count: Int, value: Int)]
    
    static func countCardValues(_ cards: [Card]) -> HandCounts {
        var counts = [Int](repeating: 0, count: 15)
        for card in cards {
            counts[card.value] += 1
        }
        return counts
            .enumerated()
            .compactMap { $1 > 0 ? (count: $1, value: $0) : nil }
            .sorted { $0.count > $1.count || ($0.count == $1.count && $0.value > $1.value) }
    }
    
    static func detectFlush(_ cards: [Card]) -> Bool {
        Set(cards.map { $0.suit }).count == 1
    }
    
    static func detectStraight(_ handCounts: HandCounts) -> Bool {
        guard handCounts.count == 5 else { return false }
        let values = handCounts.map { $0.value }.sorted(by: >)
        return (0..<4).allSatisfy { values[$0] == values[$0 + 1] + 1 } || isAceLowStraight(values)
    }
    
    static func isAceLowStraight(_ values: [Int]) -> Bool {
        values.sorted(by: >) == [14, 5, 4, 3, 2]
    }
    
    static func computeTieBreak(_ handCounts: HandCounts, isAceLowStraight: Bool) -> Int {
        if isAceLowStraight {
            return PokerHand.aceLowStraightTieBreak
        }
        return handCounts.reduce(0) { $0 * 14 + $1.value }
    }
    
    static func evaluateRank(isFlush: Bool, isStraight: Bool, handCounts: HandCounts, tieBreak: Int) -> (rank: Int, tieBreak: Int) {
        switch (isFlush, isStraight, handCounts[0].count, handCounts[1].count) {
        case (true, true, _, _): return (8, tieBreak) // straight flush
        case (_, _, 4, _): return (7, tieBreak) // four of a kind
        case (_, _, 3, 2): return (6, tieBreak) // full house
        case (true, _, _, _): return (5, tieBreak) // flush
        case (_, true, _, _): return (4, tieBreak) // straight
        case (_, _, 3, _): return (3, tieBreak) // three of a kind
        case (_, _, 2, 2): return (2, tieBreak) // two pair
        case (_, _, 2, _): return (1, tieBreak) // one pair
        default: return (0, tieBreak) // high card
        }
    }
}

//PokerHand
struct PokerHand {
    private let hand: String
    let handRank: (rank: Int, tieBreak: Int)
    
    static let cardValue = [
        "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 10,
        "J": 11, "Q": 12, "K": 13, "A": 14
    ]
    
    static let aceLowStraightTieBreak = 5 * 14 * 14 * 14 * 14 + 4 * 14 * 14 * 14 + 3 * 14 * 14 + 2 * 14 + 1 // tie-break for A,5,4,3,2
    
    init?(_ hand: String) {
        guard let rank = PokerHand.evaluate(hand) else { return nil }
        self.hand = hand
        self.handRank = rank
    }
    
    static func evaluate(_ hand: String) -> (rank: Int, tieBreak: Int)? {
        guard let cards = HandValidator.validate(hand) else { return nil }
        
        let handCounts = HandEvaluator.countCardValues(cards)
        let isFlush = HandEvaluator.detectFlush(cards)
        let isStraight = HandEvaluator.detectStraight(handCounts)
        let isAceLowStraight = HandEvaluator.isAceLowStraight(handCounts.map { $0.value })
        let tieBreak = HandEvaluator.computeTieBreak(handCounts, isAceLowStraight: isAceLowStraight)
        
        return HandEvaluator.evaluateRank(
            isFlush: isFlush,
            isStraight: isStraight,
            handCounts: handCounts,
            tieBreak: tieBreak
        )
    }
}

//Poker
struct Poker {
    static func bestHand(_ hands: [String]) -> String? {
        hands.compactMap { hand in
                PokerHand.evaluate(hand).map { (hand, $0) }
            }.max { $0.1 < $1.1 }?.0
    }
}