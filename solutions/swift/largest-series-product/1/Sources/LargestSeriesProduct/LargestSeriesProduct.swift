enum NumberSeriesError: Error {
    case spanLongerThanInput
    case invalidCharacter
    case spanIsZeroOrNegative
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
        guard span > 0 else {
            throw NumberSeriesError.spanIsZeroOrNegative
        }
        guard span <= input.count else {
            throw NumberSeriesError.spanLongerThanInput
        }
        
        let end = input.count - span
        return try (0...end).map { try calculateProduct(offset: $0, span: span) }.max() ?? 0
    }
    
    private func calculateProduct(offset: Int, span: Int) throws -> Int {
        let substring = input[input.index(input.startIndex, offsetBy: offset)..<input.index(input.startIndex, offsetBy: offset + span)]
        return substring.reduce(1) { product, character in
            product * (Int(String(character)) ?? 1)
        }
    }
}
