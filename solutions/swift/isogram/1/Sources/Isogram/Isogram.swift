func isIsogram(_ string: String) -> Bool {
  var seenLetters = Set<Character>()
    
  for letter in string.lowercased() where letter.isLetter {
    if !seenLetters.insert(letter).inserted {
      return false
    }
  }

  return true
}
