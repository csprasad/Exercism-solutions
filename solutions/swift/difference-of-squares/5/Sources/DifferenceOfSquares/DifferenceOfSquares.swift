class Squares {
  let limit: Int
  let sum: Int
  let sumOfSquares: Int

  init(_ limit: Int) {
    self.limit = max(limit, 0)

    var totalSum = 0
    var totalSumOfSquares = 0

    for i in 1...self.limit {
      totalSum += i
      totalSumOfSquares += i * i
    }

    self.sum = totalSum
    self.sumOfSquares = totalSumOfSquares
  }

  var squareOfSum: Int {
    return sum * sum
  }

  var differenceOfSquares: Int {
    return squareOfSum - sumOfSquares
  }
}
