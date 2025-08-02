import Foundation

class IsbnVerifier {
  static func isValid(_ string: String) -> Bool {
    let cleaned = string.replacingOccurrences(of: "-", with: "")
    guard cleaned.count == 10 else { return false }

    var checksum = 0
    for (index, char) in cleaned.enumerated() {
      if let digit = char.wholeNumberValue {
        checksum += digit * (index + 1)
      } else if char == "X" && index == 9 {
        checksum += 10 * (index + 1)
      } else {
        return false
      }
    }

    return checksum % 11 == 0
  }
}
