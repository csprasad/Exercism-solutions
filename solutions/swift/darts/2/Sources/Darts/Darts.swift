func dartScore(x: Double, y: Double) -> Int {
  let distanceSquared = x * x + y * y

  switch distanceSquared {
    case ...1: return 10
    case ...25: return 5
    case ...100: return 1
    default: return 0
  }
}
