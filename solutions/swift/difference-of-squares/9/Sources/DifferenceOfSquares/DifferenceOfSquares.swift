class Squares {
  let squareOfSum: Int
  let sumOfSquares: Int
  let differenceOfSquares: Int

  init(_ n: Int) {
    let n = max(n, 0)
    let sum = n * (n + 1) / 2
    self.squareOfSum = sum * sum
    self.sumOfSquares = n * (n + 1) * (2 * n + 1) / 6
    self.differenceOfSquares = squareOfSum - sumOfSquares
  }
}
