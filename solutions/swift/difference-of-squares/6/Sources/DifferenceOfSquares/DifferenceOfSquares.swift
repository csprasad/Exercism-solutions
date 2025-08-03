class Squares {
  let limit: Int
  let sum: Int
  let sumOfSquares: Int

  init(_ limit: Int) {
    self.limit = max(limit, 0)
    let n = self.limit
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
