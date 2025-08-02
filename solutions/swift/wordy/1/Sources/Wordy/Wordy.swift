import Foundation

enum WordyError: Error {
    case syntaxError
}

enum CommandOperation: String {
    case plus = "plus"
    case minus = "minus"
    case multiply = "multiplied by"
    case divide = "divided by"
}

func wordyAnswer(_ question: String) throws -> Int {
    guard question.hasPrefix("What is ") else {
        throw WordyError.syntaxError
    }
    
    let cleanedQuestion = question
        .replacingOccurrences(of: "What is ", with: "")
        .replacingOccurrences(of: "?", with: "")
        .replacingOccurrences(of: CommandOperation.multiply.rawValue, with: "*")
        .replacingOccurrences(of: CommandOperation.divide.rawValue, with: "/")
    
    let tokens = cleanedQuestion.split(separator: " ").map(String.init)
    if tokens.count == 1, let number = Int(tokens[0]) {
        return number
    }
    guard tokens.count >= 3, let initialNumber = Int(tokens[0]) else {
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
        case CommandOperation.plus.rawValue:
            result += nextNumber
        case CommandOperation.minus.rawValue:
            result -= nextNumber
        case "*":
            result *= nextNumber
        case "/":
            result /= nextNumber
        default:
            throw WordyError.syntaxError
        }
        
        index += 2
    }
    
    return result
}
