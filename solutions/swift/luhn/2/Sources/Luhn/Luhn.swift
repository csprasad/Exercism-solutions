func isValidInput(_ input: String) -> String? {
  var cleanedDigits = ""

  for char in input {
    if char.isNumber {
      cleanedDigits.append(char)
    } else if !char.isWhitespace {
      return nil
    }
  }

  return cleanedDigits.count >= 2 ? cleanedDigits : nil
}

func checkSum(_ digits: String) -> Int {
  var sum = 0

  for (index, digitChar) in digits.enumerated() {
    guard let digit = digitChar.wholeNumberValue else { continue }
    let rightToLeftIndex = digits.count - 1 - index

    if rightToLeftIndex % 2 == 1 { 
      let doubled = digit * 2
      sum += (doubled > 9) ? doubled - 9 : doubled
    } else {
      sum += digit
    }
  }
  return sum
}


func isValidLuhn(_ digits: String) -> Bool {
  guard let cleanedDigits = isValidInput(digits) else {
    return false
  }

  let sum = checkSum(cleanedDigits)
  return sum % 10 == 0
}
