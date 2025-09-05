class Anagram {
  let word: String
  let lowercasedWord: String
  let wordFrequency: [Character: Int]

  init(word: String) {
    self.word = word
    self.lowercasedWord = word.lowercased()
    self.wordFrequency = Anagram.buildFrequencyMap(for: lowercasedWord)
  }

  func match(_ candidates: [String]) -> [String] {
    candidates.filter { candidate in
                           let lowercasedCandidate = candidate.lowercased()
                           return lowercasedCandidate != lowercasedWord && 
                           Anagram.buildFrequencyMap(for: lowercasedCandidate) == wordFrequency
                          }
  }

  private static func buildFrequencyMap(for string: String) -> [Character: Int] {
    var frequency: [Character: Int] = [:]
    string.forEach { frequency[$0, default: 0] += 1 }
    return frequency
  }
}