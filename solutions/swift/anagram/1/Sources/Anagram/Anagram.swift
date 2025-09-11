public struct Anagram {
  private let word: String
  private let lower: String
  private let signature: [Int]

  public init(word: String) {
    self.word = word
    self.lower = word.lowercased()
    self.signature = Anagram.makeSignature(self.lower)
  }

  public func match(_ items: [String]) -> [String] {
    items.lazy.filter { item in
                       let itemLower = item.lowercased()
                       guard itemLower != lower else { return false}
                       return Anagram.makeSignature(itemLower) == signature
                      }
  }

  private static func makeSignature(_ s: String) -> [Int] {
    var counts = Array(repeating: 0, count: 26)
    for u in s.unicodeScalars {
      let value = Int(u.value)
      if value >= 65 && value <= 90 { // A-Z
        counts[value - 65] += 1
      } else if value >= 97 && value <= 122 { // a-z
        counts[value - 97] += 1
      }
    }
    return counts
  }
}
