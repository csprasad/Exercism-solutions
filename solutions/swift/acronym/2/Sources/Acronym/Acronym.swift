import Foundation

struct Acronym {
    static func abbreviate(_ input: String) -> String {
        let clean = input.replacingOccurrences(of: "-", with: " ")
            .filter { $0.isLetter || $0.isWhitespace }

        return clean.split(separator: " ")
            .compactMap { $0.first?.uppercased() }
            .joined()
    }
}

