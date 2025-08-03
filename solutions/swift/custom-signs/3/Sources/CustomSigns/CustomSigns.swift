let birthday = "Birthday"
let valentine = "Valentine's Day"
let anniversary = "Anniversary"
let space: Character = " "
let exclamation: Character = "!"

func buildSign(for occasion: String, name: String) -> String {
  "Happy \(occasion) \(name)\(exclamation)"
}

func graduationFor(name: String, year: Int) -> String {
  """
  Congratulations \(name)\(exclamation)
  Class of \(year)
  """
}

func costOf(sign: String) -> Int {
  let basePrice = 20
  let pricePerCharacter = 2
  return basePrice + (sign.count * pricePerCharacter)
}
