func toRna(_ dna: String) -> String {
    let dnaToRna: [Character: Character] = [
        "C": "G",
        "G": "C",
        "T": "A",
        "A": "U"
    ]
    
    return String(dna.compactMap { dnaToRna[$0] })
}
