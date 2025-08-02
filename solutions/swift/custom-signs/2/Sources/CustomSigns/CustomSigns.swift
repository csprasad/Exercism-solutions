let birthday = "Birthday"
let valentine = "Valentine's Day"
let anniversary = "Anniversary"
let space: Character = " "
let exclamation: Character = "!"

func buildSign(for occasion: String, name: String) -> String {
    "Happy \(occasion) \(name)\(exclamation)"
}

func graduationFor(name: String, year: Int) -> String {
  "Congratulations \(name)\(exclamation)\nClass of \(year)"
}

func costOf(sign: String) -> Int {
    20 + (sign.count * 2)
}
