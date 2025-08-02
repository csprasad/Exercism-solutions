import Foundation

enum WordyError: Error {
    case syntaxError
}

//Added CaseIterable to iterate over all cases easily.
enum CommandOperation: String, CaseIterable {
    case plus = "plus"
    case minus = "minus"
    case multiply = "multiplied by"
    case divide = "divided by"
    
    var symbol: String {
        switch self {
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "*"
        case .divide: return "/"
        }
    }
}

func wordyAnswer(_ question: String) throws -> Int {
    guard question.hasPrefix("What is ") else {
        throw WordyError.syntaxError
    }
    
    var expression = question
        .replacingOccurrences(of: "What is ", with: "")
        .replacingOccurrences(of: "?", with: "")
    
    // Replaced operation phrases with symbols
    for operation in CommandOperation.allCases {
        expression = expression.replacingOccurrences(of: operation.rawValue, with: operation.symbol)
    }
    
    let tokens = expression.split(separator: " ").map(String.init)
    
    guard tokens.count >= 1, let initialNumber = Int(tokens[0]) else {
        throw WordyError.syntaxError
    }
    
    var result = initialNumber
    var index = 1
    
    while index < tokens.count {
        guard index + 1 < tokens.count,
              let nextNumber = Int(tokens[index + 1]) else {
            throw WordyError.syntaxError
        }
        
        switch tokens[index] {
        case CommandOperation.plus.symbol:
            result += nextNumber
        case CommandOperation.minus.symbol:
            result -= nextNumber
        case CommandOperation.multiply.symbol:
            result *= nextNumber
        case CommandOperation.divide.symbol:
            result /= nextNumber
        default:
            throw WordyError.syntaxError
        }
        
        index += 2
    }
    
    return result
}
