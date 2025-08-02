import Foundation

enum Classification {
  case perfect
  case abundant
  case deficient
}

enum ClassificationError: Error {
  case invalidInput
}

func classify(number: Int) throws -> Classification {
  guard number > 0 else {
    throw ClassificationError.invalidInput
  }

  var aliquotSum = 0
  let sqrtNumber = Int(sqrt(Double(number)))

  for i in 1..<number {
    if number % i == 0 {
      aliquotSum += i
    }
  }

  if aliquotSum == number {
    return .perfect
  } else if aliquotSum > number {
    return .abundant
  } else {
    return .deficient
  }
}

