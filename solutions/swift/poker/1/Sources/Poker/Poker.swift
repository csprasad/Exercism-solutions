import Foundation

enum HandRank: Int {
    case highCard, onePair, twoPair, threeOfAKind, straight, flush, fullHouse, fourOfAKind, straightFlush
}

struct PokerHand: Comparable, Equatable {
    let hand: String
    let handRank: (rank: Int, tieBreak: Int)
    
    init?(_ hand: String) {
        guard let value = PokerHand.evaluate(hand) else { return nil }
        self.hand = hand
        self.handRank = value
    }
    
    static func == (lhs: PokerHand, rhs: PokerHand) -> Bool {
        lhs.hand == rhs.hand && lhs.handRank.rank == rhs.handRank.rank && lhs.handRank.tieBreak == rhs.handRank.tieBreak
    }
    
    static func < (lhs: PokerHand, rhs: PokerHand) -> Bool {
        lhs.handRank.rank != rhs.handRank.rank
            ? lhs.handRank.rank < rhs.handRank.rank
            : lhs.handRank.tieBreak < rhs.handRank.tieBreak
    }
    
    private static let cardValue = [
        "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 10,
        "J": 11, "Q": 12, "K": 13, "A": 14
    ]
    
    typealias Card = String
    typealias HandCounts = [(count: Int, value: Int)]
    
    private static func validateCards(_ hand: String) -> [Card]? {
        let cards = hand.components(separatedBy: .whitespaces).filter { !$0.isEmpty }
        guard cards.count == 5, Set(cards).count == 5 else { return nil }
        for card in cards {
            guard card.count >= 2,
                  let suit = card.last, "♤♡♢♧".contains(suit),
                  cardValue[String(card.dropLast())] != nil else {
                return nil
            }
        }
        return cards
    }
    
    private static func evaluate(_ hand: String) -> (Int, Int)? {
        guard let cards = validateCards(hand) else { return nil }
        
        // Collect card values and counts
        var counts = [Int](repeating: 0, count: 15) // 1-14 for A,2,...,K
        var values = [Int]()
        var suits = [Character]()
        for card in cards {
            guard let value = cardValue[String(card.dropLast())] else { return nil }
            counts[value] += 1
            values.append(value)
            suits.append(card.last!)
        }
        
        // Group by count and value
        let handCounts: HandCounts = counts.enumerated()
            .compactMap { $1 > 0 ? ($1, $0) : nil }
            .sorted { $0.count > $1.count || ($0.count == $1.count && $0.value > $1.value) }
        
        // Compute tiebreak
        var tieBreak = 0
        let isFlush = Set(suits).count == 1
        let sortedUniqueValues = Array(Set(values)).sorted()
        var isStraight = sortedUniqueValues.count == 5 && sortedUniqueValues.last! - sortedUniqueValues.first! == 4
        
        // Handle ace-low straight (A,2,3,4,5)
        if sortedUniqueValues == [2, 3, 4, 5, 14] {
            isStraight = true
            tieBreak = 5 * 100 + 4 // Lowest straight tiebreak
        }
        
        // Evaluate hand rank
        let rank: HandRank
        switch (isFlush, isStraight, handCounts[0].count, handCounts.count > 1 ? handCounts[1].count : 0) {
        case (true, true, _, _):
            rank = .straightFlush
            tieBreak = isStraight ? sortedUniqueValues.last! : tieBreak
        case (_, _, 4, _):
            rank = .fourOfAKind
            tieBreak = handCounts[0].value * 100 + (handCounts.count > 1 ? handCounts[1].value : 0)
        case (_, _, 3, 2):
            rank = .fullHouse
            tieBreak = handCounts[0].value * 100 + handCounts[1].value // Prioritize three-of-a-kind
        case (true, _, _, _):
            rank = .flush
            tieBreak = values.sorted(by: >).reduce(0) { $0 * 100 + $1 }
        case (_, true, _, _):
            rank = .straight
            if !isAceLowStraight(values) { tieBreak = sortedUniqueValues.last! }
        case (_, _, 3, _):
            rank = .threeOfAKind
            tieBreak = handCounts[0].value * 100 + values.filter { $0 != handCounts[0].value }.sorted(by: >).reduce(0) { $0 * 100 + $1 }
        case (_, _, 2, 2):
            rank = .twoPair
            tieBreak = handCounts[0].value * 10000 + handCounts[1].value * 100 + values.filter { $0 != handCounts[0].value && $0 != handCounts[1].value }.first!
        case (_, _, 2, _):
            rank = .onePair
            tieBreak = handCounts[0].value * 10000 + values.filter { $0 != handCounts[0].value }.sorted(by: >).reduce(0) { $0 * 100 + $1 }
        default:
            rank = .highCard
            tieBreak = values.sorted(by: >).reduce(0) { $0 * 100 + $1 }
        }
        
        return (rank.rawValue, tieBreak)
    }
    
    private static func isAceLowStraight(_ values: [Int]) -> Bool {
        Array(Set(values)).sorted() == [2, 3, 4, 5, 14]
    }
}

struct Poker {
    static func bestHand(_ hands: [String]) -> String {
        hands.compactMap { PokerHand($0) }.max()?.hand ?? ""
    }
}
