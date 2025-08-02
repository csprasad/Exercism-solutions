enum BaseError: Error, Equatable {
  case invalidInputBase, invalidOutputBase, negativeDigit, invalidPositiveDigit
}

struct Base {

  static func outputDigits(inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {
    guard inputBase > 1 else { throw BaseError.invalidInputBase }
    guard outputBase > 1 else { throw BaseError.invalidOutputBase }

    let decimalValue = try inputDigits.reduce(0) { (result, digit) in
      if digit < 0 || digit >= inputBase {
          throw digit < 0 ? BaseError.negativeDigit : BaseError.invalidPositiveDigit
      }
      return result * inputBase + digit
    }

    guard decimalValue != 0 else { return [0] }
    var result = [Int]()
    var num = decimalValue
    while num > 0 {
      result.append(num % outputBase)
      num /= outputBase
    }

    return result.reversed()
  }
}