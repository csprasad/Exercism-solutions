func toLimit(_ limit: Int, inMultiples: [Int]) -> Int {
    var multiplesSet = Set<Int>()
    
    for multiple in inMultiples where multiple > 0 {
        multiplesSet.formUnion(stride(from: multiple, to: limit, by: multiple))
    }
    
    return multiplesSet.reduce(0, +)
}
