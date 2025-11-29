import Foundation

enum ResistorColorDuo: Int, CaseIterable {
  case black = 0, brown, red, orange, yellow, green, blue, violet, grey, white

  static let colorsMap: [String: Int] = Dictionary(uniqueKeysWithValues: Self.allCases.map { ("\($0)".lowercased(), $0.rawValue) })

  static func value(for colors: [String]) -> Int { 
    guard colors.count >= 2 else { return 0 }

    let firstKey = colors[0].lowercased()
    let secondKey = colors[1].lowercased()

    guard
      let first = colorsMap[firstKey],
      let second = colorsMap[secondKey]
    else { return 0 }

    return first * 10 + second
  }
}