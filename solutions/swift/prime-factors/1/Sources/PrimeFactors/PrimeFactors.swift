func primeFactors(_ number: Int64) -> [Int64] {
    var divisors = [Int64]()
    var i = number
    var counter: Int64 = 2

    while i > 1 {
        if i % counter == 0 {
            divisors.append(counter)
            i /= counter 
        } else {
            counter += 1
            
            if counter * counter > i {
                if i > 1 {
                    divisors.append(i)
                }
                break
            }
        }
    }
    
    return divisors
}
