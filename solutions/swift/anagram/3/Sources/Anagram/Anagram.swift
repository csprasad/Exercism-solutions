class Anagram {
  let word: String
  let lowercasedWord: String
  let wordFrequency: [Character: Int]

  init(word: String) {
    self.word = word
    self.lowercasedWord = word.lowercased()
    self.wordFrequency = Anagram.frequencyMap(for: lowercasedWord)
  }

  func match(_ candidates: [String]) -> [String] {
    candidates.filter { candidate in
                         let lowercasedCandidate = candidate.lowercased()
                         guard lowercasedCandidate != lowercasedWord else { return false }
                         guard lowercasedCandidate.count == lowercasedWord.count else { return false }
                         return Anagram.frequencyMap(for: lowercasedCandidate) == wordFrequency
                      }
  }

  private static func frequencyMap(for string: String) -> [Character: Int] {
    var frequency: [Character: Int] = [:]
    string.forEach { frequency[$0, default: 0] += 1 }
    return frequency
  }
}