class Allergies {
  private let allergens: [String] = [
    "eggs", "peanuts", "shellfish", "strawberries", 
    "tomatoes", "chocolate", "pollen", "cats"
  ]

  private var score: Int

  init(_ score: Int) {
    self.score = score
  }

  func allergicTo(item: String) -> Bool {
    guard let index = allergens.firstIndex(of: item) else { return false }
    return score & (1 << index) != 0
  }

  func list() -> [String] {
    return allergens.enumerated()
                    .filter { score & (1 << $0.offset) != 0 }
                    .map { $0.element }
  }
}
