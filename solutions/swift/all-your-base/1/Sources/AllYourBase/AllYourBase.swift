import Foundation

enum BaseError: Error, Equatable {
  case invalidInputBase
  case invalidOutputBase
  case negativeDigit
  case invalidPositiveDigit
}

struct Base {

  static func outputDigits(inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {
    guard inputBase > 1 else {
      throw BaseError.invalidInputBase
    }

    guard outputBase > 1 else {
      throw BaseError.invalidOutputBase
    }

    var decimalValue = 0
    for (index, digit) in inputDigits.reversed().enumerated() {
      guard digit >= 0 else {
        throw BaseError.negativeDigit
      }
      guard digit < inputBase else {
        throw BaseError.invalidPositiveDigit
      }
      decimalValue += digit * Int(pow(Double(inputBase), Double(index)))
    }

    if decimalValue == 0 {
      return [0]
    }

    var result = [Int]()
    var num = decimalValue
    while num > 0 {
      result.append(num % outputBase)
      num /= outputBase
    }

    return result.reversed()
  }
}