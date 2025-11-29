import Foundation

enum ResistorColorDuo: Int, CaseIterable {
  case black = 0
  case brown = 1
  case red = 2
  case orange = 3
  case yellow = 4
  case green = 5
  case blue = 6
  case violet = 7
  case grey = 8
  case white = 9

  static let colorsMap: [String: Int] = Dictionary(uniqueKeysWithValues: Self.allCases.map { ("\($0)".lowercased(), $0.rawValue) })

  static func value(for colors: [String]) -> Int { 
    guard
      colors.count >= 2,
      let first = colorsMap[colors[0].lowercased()],
      let second = colorsMap[colors[1].lowercased()]
    else { return 0 }

    return first * 10 + second
  }
}