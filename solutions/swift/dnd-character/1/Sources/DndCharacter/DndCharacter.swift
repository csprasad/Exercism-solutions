import Foundation

func modifier(_ score: Int) -> Int {
  Int(floor(Double(score - 10) / 2.0))
}

func ability() -> Int {
  let rolls = (0..<4).map { _ in Int.random(in: 1...6) }
  return rolls.sorted(by: >).prefix(3).reduce(0, +)
}

struct DndCharacter {
  var strength = ability()
  var dexterity = ability()
  var constitution = ability()
  var intelligence = ability()
  var wisdom = ability()
  var charisma = ability()

  var hitpoints: Int {
    10 + modifier(constitution)
  }
}