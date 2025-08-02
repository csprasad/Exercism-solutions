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
        
        if span == input.count {
            return try calculateProduct(offset: 0, span: span)
        }
        
        return try (0...(input.count - span)).map { try calculateProduct(offset: $0, span: span) }.max() ?? 0
    }
    
    private func calculateProduct(offset: Int, span: Int) throws -> Int {
        let substring = input[input.index(input.startIndex, offsetBy: offset)..<input.index(input.startIndex, offsetBy: offset + span)]
        if substring.contains("0") { return 0 }
        return substring.compactMap { Int(String($0)) }.reduce(1, *)
    }
}
