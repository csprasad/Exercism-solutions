import Foundation

struct Robot {
    private static var usedNames: Set<String> = []
    private static let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    private static let numbers = "0123456789"
    
    private(set) var name: String
    
    init() {
        self.name = Robot.generateUniqueName()
    }
    
    private static func generateUniqueName() -> String {
        var newName: String
        repeat {
            newName = generateName()
        } while usedNames.contains(newName)
        
        usedNames.insert(newName)
        return newName
    }
    
    private static func generateName() -> String {
        let randomLetters = String((0..<2).map { _ in letters.randomElement()! })
        let randomNumbers = String((0..<3).map { _ in numbers.randomElement()! })
        return randomLetters + randomNumbers
    }
    
    mutating func resetName() {
        Robot.usedNames.remove(name)
        self.name = Robot.generateUniqueName()
    }
}
