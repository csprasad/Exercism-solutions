import Foundation

func splitOnNewlines(_ poem: String) -> [String] {
    poem.split(separator: "\n", omittingEmptySubsequences: false).map { String($0) }
}

func firstLetter(_ line: String) -> Character {
    line.first ?? "_"
}

func capitalize(_ phrase: String) -> String {
    phrase.capitalized
}

func trimSentence(_ line: String) -> String {
    line.trimmingCharacters(in: .whitespaces)
}

func lastLetter(_ line: String) -> Character {
    line.last ?? "_"
}

func backDoorPassword(_ phrase: String) -> String {
    capitalize(phrase) + ", please"
}

func ithLetter(_ line: String, i: Int) -> Character {
    (i >= 0 && i < line.count) ? line[line.index(line.startIndex, offsetBy: i)] : " "  
}

func secretRoomPassword(_ phrase: String) -> String {
    phrase.uppercased() + "!"
}
