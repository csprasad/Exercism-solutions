class CollatzConjecture {
  enum CollatzError: Error {
    case invalidInput
  }
  
  static func steps(_ number: Int) throws -> Int? {
    
    guard number > 0 else {
      throw CollatzError.invalidInput
    }
    var n = number 
    var steps = 0
    
    while n != 1 {
        if (n % 2) == 0 {
          n /= 2 
        } else {
          n = 3 * n + 1
        }
        steps += 1
    }
    
    return steps
  }
}
