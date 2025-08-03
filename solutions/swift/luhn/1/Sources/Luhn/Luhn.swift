func checkSum(_ digits: String) -> Int {
  var sum = 0
  let reversedDigits = digits.reversed()

  for (index, digitChar) in reversedDigits.enumerated() {
    guard let digit = digitChar.wholeNumberValue else { continue }

    if index % 2 == 1 {
      let doubled = digit * 2
      sum += (doubled > 9) ? doubled - 9 : doubled
    } else {
      sum += digit
    }
  }
  return sum
}

func isValidLuhn(_ digits: String) -> Bool {
  if digits.contains(where: { !$0.isNumber && !$0.isWhitespace }) {
    return false
  }

  let cleanedDigits = digits.filter { $0.isNumber }

  if cleanedDigits.count < 2 || cleanedDigits == "0" {
    return false
  }

  let sum = checkSum(cleanedDigits)
  return sum % 10 == 0
}
