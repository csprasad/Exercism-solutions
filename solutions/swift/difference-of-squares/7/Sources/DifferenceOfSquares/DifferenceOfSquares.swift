class Squares {
  private let sum: Int
  let sumOfSquares: Int

  init(_ n: Int) {
    let n = max(n, 0)
    self.sum = n * (n + 1) / 2
    self.sumOfSquares = n * (n + 1) * (2 * n + 1) / 6
  }

  var squareOfSum: Int {
    return sum * sum
  }

  var differenceOfSquares: Int {
    return squareOfSum - sumOfSquares
  }
}
