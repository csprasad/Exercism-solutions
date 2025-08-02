enum NumberSeriesError: Error {
    case spanLongerThanInput, invalidCharacter, spanIsZeroOrNegative
}

class NumberSeries {
    let input: String
    
    init(_ input: String) throws {
        guard input.allSatisfy({ $0.isNumber }) else {
            throw NumberSeriesError.invalidCharacter
        }
        self.input = input
    }
    
    func largestProduct(_ span: Int) throws -> Int {
        let count = input.count
        
        guard span > 0 else {
            throw NumberSeriesError.spanIsZeroOrNegative
        }
        
        guard span <= count else {
            throw NumberSeriesError.spanLongerThanInput
        }
        
        var maxProduct = 0
        var currentProduct = 1
        var start = 0
        
        for end in 0..<count {
            let digit = input[input.index(input.startIndex, offsetBy: end)]
            let num = Int(String(digit))!
            
            if num == 0 {
                currentProduct = 1
                start = end + 1
                continue 
            }
            
            currentProduct *= num
            
            if end - start + 1 == span {
                if currentProduct > maxProduct {
                    maxProduct = currentProduct
                }
                
                let startDigit = input[input.index(input.startIndex, offsetBy: start)]
                let startNum = Int(String(startDigit))!
                currentProduct /= startNum
                start += 1
            }
        }
        
        return maxProduct
    }
}
