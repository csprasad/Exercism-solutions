func toLimit(_ limit: Int, inMultiples: [Int]) -> Int {
    guard limit > 0 else { return 0 }
    
    var multiplesSet = Set<Int>()
    
    for base in inMultiples {
        if base <= 0 { continue }
        
        let multiples = stride(from: base, to: limit, by: base)
        multiplesSet.formUnion(multiples)
    }
    
    return multiplesSet.reduce(0, +)
}
