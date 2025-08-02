enum HammingError: Error {
  case unequalLength
}

func compute(_ dnaSequence: String, against: String) throws -> Int? {
  guard dnaSequence.count == against.count else {
    throw HammingError.unequalLength
  }

  let distance = zip(dnaSequence, against).filter { $0 != $1 }.count

  return distance
}
