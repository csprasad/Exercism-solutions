enum PhoneNumberError: Error {
    case invalidPhoneNumber
}

class PhoneNumber {
  private var originalInput: String

  init(_ input: String) {
    self.originalInput = input
  }

  func clean() throws -> String {
    let digits = originalInput.filter { $0.isNumber }

    if digits.hasPrefix("1") && digits.count == 11 {
      let cleaned = String(digits.dropFirst())
      guard isValid(cleaned) else { throw PhoneNumberError.invalidPhoneNumber }
      return cleaned
    }

    guard digits.count == 10, isValid(digits) else {
      throw PhoneNumberError.invalidPhoneNumber
    }

    return digits
  }

  private func isValid(_ digits: String) -> Bool {
    guard digits.count == 10 else { return false }

    let areaCodeFirstDigit = digits.first!
    guard areaCodeFirstDigit >= "2" && areaCodeFirstDigit <= "9" else { return false }

    let exchangeCodeFirstDigit = digits[digits.index(digits.startIndex, offsetBy: 3)]
    guard exchangeCodeFirstDigit >= "2" && exchangeCodeFirstDigit <= "9" else { return false }

    return true
  }
}
