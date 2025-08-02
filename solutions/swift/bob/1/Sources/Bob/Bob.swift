import Foundation

class Bob {
  static func response(_ message: String) -> String {
    let trimmedInput = message.trimmingCharacters(in: .whitespacesAndNewlines)
    let isQuestion = trimmedInput.hasSuffix("?")
    let isYelling = trimmedInput == trimmedInput.uppercased() && trimmedInput.rangeOfCharacter(from: .letters) != nil
    
    if trimmedInput.isEmpty {
        return "Fine. Be that way!"
    }
    
    if isYelling && isQuestion {
        return "Calm down, I know what I'm doing!"
    }
    
    if isYelling {
        return "Whoa, chill out!"
    }
    
    if isQuestion {
        return "Sure."
    }
    
    return "Whatever."
  }
}
