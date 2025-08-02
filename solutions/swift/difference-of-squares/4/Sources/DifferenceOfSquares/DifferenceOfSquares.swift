class Squares {
    let limit: Int

    init(_ limit: Int) {
        self.limit = max(limit, 0)
    }

    lazy var squareOfSum: Int = {
        let sum = (1...self.limit).reduce(0,+)
        return sum * sum
    }()

    lazy var sumOfSquares: Int = {
        (1...self.limit).map {$0 * $0}.reduce(0,+)
    }()

    lazy var differenceOfSquares:Int = {
        squareOfSum - sumOfSquares
    }()
  
}