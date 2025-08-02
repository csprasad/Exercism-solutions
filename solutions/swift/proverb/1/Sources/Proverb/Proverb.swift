class Proverb {
  let words: [String]

  init(_ words: [String] = []) {
    self.words = words
  }

  func recite() -> String {
    guard let first = words.first else { return "" }

    let lines = zip(words, words.dropFirst())
                .map { "For want of a \($0) the \($1) was lost." }

    return (lines + ["And all for the want of a \(first)."]).joined(separator: "\n")
  }
}
