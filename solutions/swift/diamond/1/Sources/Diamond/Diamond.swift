class Diamond {
  static func makeDiamond(letter: Character) -> [String] {
    let letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let index = letters.firstIndex(of: letter)!
    let diamondHeight = index * 2 + 1
    var diamond = [String]()

    for i in 0..<diamondHeight {
      var line = ""
      let charIndex = i <= index ? i : diamondHeight - i - 1

      let leadingSpaces = String(repeating: " ", count: index - charIndex)
      line += leadingSpaces

      line += String(letters[charIndex])  
      if charIndex != 0 {
        line += String(repeating: " ", count: (charIndex * 2) - 1)
        line += String(letters[charIndex])  
      }

      line += leadingSpaces

      diamond.append(line)
    }

    return diamond
  }
}
