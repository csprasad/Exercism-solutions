enum NucleotideCountErrors: Error {
  case invalidNucleotide
}


class DNA {
  private var result: [String: Int] = [ "A": 0, "C": 0, "G": 0, "T": 0]

  init(strand: String) throws {
    for c in strand {
      let key = String(c)
      if let count = result[key] {
        result[key] = count + 1
      } else {
        throw NucleotideCountErrors.invalidNucleotide
      }
    }
  }

  func counts() -> [String: Int] {
    result
  }
}
