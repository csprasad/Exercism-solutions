func toRna(_ dna: String) -> String {
    let dnaToRna: [Character: Character] = [
        "G": "C",
        "C": "G",
        "T": "A",
        "A": "U"
    ]
    let rna = dna.map { dnaToRna[$0]! }
    return String(rna)
}
