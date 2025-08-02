import Foundation

struct Acronym {
  static func abbreviate(_ inString: String) -> String {
    let separatedArray = inString.components(separatedBy: CharacterSet(charactersIn: " -_"))
    let firstLetters = separatedArray.compactMap { $0.first }
    let acronym = String(firstLetters).uppercased
    return acronym
  }
}
