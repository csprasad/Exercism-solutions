import Foundation

class BottleSong {
    private let bottles: Int
    
    init(bottles: Int) {
        self.bottles = bottles
    }

    private func numberToWord(number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        let spelledOut = formatter.string(from: NSNumber(value: number)) ?? "\(number)"
        return spelledOut == "zero" ? "no" : spelledOut
    }
    
    func song(takedown: Int) -> [String] {
        var verses: [String] = []
        for i in stride(from: bottles, through: bottles - takedown + 1, by: -1) {
            verses.append(contentsOf: generateVerse(bottles: i))
            if i != bottles - takedown + 1 {
                verses.append("")
            }
        }
        return verses
    }
    
    private func generateVerse(bottles: Int) -> [String] {
        let currentBottles = bottles
        let nextBottles = max(currentBottles - 1, 0)
        
        let currentBottleWord = numberToWord(number: currentBottles).capitalized
        let nextBottleWord = numberToWord(number: nextBottles)
        
        let bottleWord = currentBottles == 1 ? "bottle" : "bottles"
        let nextBottleWordPlural = nextBottles == 1 ? "bottle" : "bottles"
        
        let verse = [
            "\(currentBottleWord) green \(bottleWord) hanging on the wall,",
            "\(currentBottleWord) green \(bottleWord) hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be \(nextBottleWord) green \(nextBottleWordPlural) hanging on the wall."
        ]
        
        return verse
    }
}