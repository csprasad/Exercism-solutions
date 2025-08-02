private let codonTable: [String: String] = [
  "AUG": "Methionine",
  "UUU": "Phenylalanine", "UUC": "Phenylalanine",
  "UUA": "Leucine", "UUG": "Leucine",
  "UCU": "Serine", "UCC": "Serine", "UCA": "Serine", "UCG": "Serine",
  "UAU": "Tyrosine", "UAC": "Tyrosine",
  "UGU": "Cysteine", "UGC": "Cysteine",
  "UGG": "Tryptophan",
  "UAA": "STOP", "UAG": "STOP", "UGA": "STOP"
]

enum TranslationError: Error {
  case invalidCodon
}

func translationOfRNA(rna: String) throws -> [String] {
  guard !rna.isEmpty else { return [] }

  var proteins: [String] = []

  //TODO: What your thoughts on using while loop to avoid stride overhead?
  //TODO: Using single var index to keep track of current position instead start & end? 
  //TODO: Might imporve readbility?
  for i in stride(from: 0, to: rna.count, by: 3) {
    let start = rna.index(rna.startIndex, offsetBy: i)
    
    guard let end = rna.index(start, offsetBy: 3, limitedBy: rna.endIndex) else {
      throw TranslationError.invalidCodon
    }
    
    let codon = String(rna[start..<end])

    guard let protein = codonTable[codon] else {
      throw TranslationError.invalidCodon
    }
    
    if protein == "STOP" {
      break
    }
    
    proteins.append(protein)
  }

  return proteins
}

