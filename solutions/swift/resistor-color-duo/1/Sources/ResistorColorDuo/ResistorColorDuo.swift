import Foundation

enum ResistorColorDuo: Int, CaseIterable {
  case black = 0, brown, red, orange, yellow, green, blue, violet, grey, white

  static let colorsMap: [String: Int] = Dictionary(uniqueKeysWithValues: Self.allCases.map { ("\($0)".lowercased(), $0.rawValue) })

  static func value(for colors: [String]) -> Int { 
    let normalized = colors.map { $0.lowercased() }
    guard
      let first = colorsMap[normalized[0]],
      let second = colorsMap[normalized[1]]
    else { return 0 }

    return first * 10 + second 
  }

}