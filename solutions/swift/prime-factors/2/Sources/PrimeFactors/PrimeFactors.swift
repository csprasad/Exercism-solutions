func primeFactors(_ number: Int64) -> [Int64] {
    var number = number
    var result = [Int64]()
    var factor: Int64 = 2
    
    while factor * factor <= number {
        if number.isMultiple(of: factor) {
            result.append(factor)
            number /= factor
        } else {
            factor += (factor == 2 ? 1 : 2) 
        }
    }
    
    if number > 1 {
        result.append(number)
    }
    
    return result
}
