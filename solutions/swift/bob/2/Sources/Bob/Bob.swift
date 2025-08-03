import Foundation

class Bob {
    static func response(_ message: String) -> String {
        let trimmedInput = message.trimmingCharacters(in: .whitespacesAndNewlines)
        let isQuestion = trimmedInput.hasSuffix("?")
        let isYelling = trimmedInput == trimmedInput.uppercased() && trimmedInput.rangeOfCharacter(from: .letters) != nil
        
        switch (trimmedInput.isEmpty, isYelling, isQuestion) {
        case (true, _, _):
            return "Fine. Be that way!"
        case (_, true, true):
            return "Calm down, I know what I'm doing!"
        case (_, true, _):
            return "Whoa, chill out!"
        case (_, _, true):
            return "Sure."
        default:
            return "Whatever."
        }
    }
}
