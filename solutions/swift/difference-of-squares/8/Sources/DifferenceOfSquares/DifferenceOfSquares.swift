class Squares {
  private let sum: Int
  let sumOfSquares: Int
  let squareOfSum: Int
  let differenceOfSquares: Int

  init(_ n: Int) {
    let n = max(n, 0)
    self.sum = n * (n + 1) / 2
    self.sumOfSquares = n * (n + 1) * (2 * n + 1) / 6
    self.squareOfSum = sum * sum
    self.differenceOfSquares = squareOfSum - sumOfSquares
  }
}
