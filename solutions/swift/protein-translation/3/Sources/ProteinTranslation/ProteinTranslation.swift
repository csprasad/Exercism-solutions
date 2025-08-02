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
  var proteins: [String] = []
  var index = rna.startIndex

  while index < rna.endIndex {
    let nextIndex = rna.index(index, offsetBy: 3, limitedBy: rna.endIndex) ?? rna.endIndex
    let codon = String(rna[index..<nextIndex])

    guard codon.count == 3 else {
      throw TranslationError.invalidCodon
    }

    guard let protein = codonTable[codon] else {
      throw TranslationError.invalidCodon
    }

    if protein == "STOP" { break }

    proteins.append(protein)
    index = nextIndex
  }

  return proteins
}
