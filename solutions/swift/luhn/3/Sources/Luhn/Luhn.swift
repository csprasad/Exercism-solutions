//cleaning
func countValidDigits(_ input: String) -> Int? {
  var digitCount = 0
  for char in input {
    if char.isWhitespace { continue }
    guard char.isNumber else { return nil }
    digitCount += 1
  }
  return digitCount >= 2 ? digitCount : nil
}

//summing
func checkSum(_ input: String, totalDigits: Int) -> Int {
  var sum = 0
  var currentPosition = 0
  for char in input {
    if char.isWhitespace { continue }
    guard let digit = char.wholeNumberValue else { return 0 }
    let rightToLeftPosition = totalDigits - 1 - currentPosition
    if rightToLeftPosition % 2 == 1 {
      let doubled = digit * 2
      sum += (doubled > 9) ? doubled - 9 : doubled
    } else {
      sum += digit
    }
    currentPosition += 1
  }
  return sum
}

//validation
func isValidLuhn(_ input: String) -> Bool {
  guard let totalDigits = countValidDigits(input) else { return false }
  let sum = checkSum(input, totalDigits: totalDigits)
  return sum % 10 == 0
}