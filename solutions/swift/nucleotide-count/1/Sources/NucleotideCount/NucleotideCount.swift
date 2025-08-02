enum NucleotideCountErrors: Error {
  case invalidNucleotide
}

class DNA {
  private let strand: String
    
  init(strand: String) throws {
    for character in strand {
      guard "ACGT".contains(character) else {
        throw NucleotideCountErrors.invalidNucleotide
      }
    }
    self.strand = strand
  }

  func counts() -> [String: Int] {
    var nucleotideCounts = ["A": 0, "C": 0, "G": 0, "T": 0]

    for nucleotide in strand {
      nucleotideCounts[String(nucleotide), default: 0] += 1
    }

    return nucleotideCounts
  }
}
