enum Plant: String {
    case violets = "V"
    case radishes = "R"
    case clover = "C"
    case grass = "G"
}

class Garden {
    private var plants: [[Plant]]
    private var children: [String]
    
    init(_ garden: String, _ roster: [String]? = nil) {
        let rows = garden.split(separator: "\n")
        plants = rows.map { row in
            row.compactMap { Plant(rawValue: String($0)) }
        }
        
        children = (roster ?? [
            "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", 
            "Ileana", "Joseph", "Kincaid", "Larry"
        ]).sorted()
    }
    
    func plantsForChild(_ child: String) -> [Plant] {
        guard let index = children.firstIndex(of: child) else { return [] }
        
        return plants.flatMap { row in
            let startIndex = index * 2
            return Array(row[startIndex..<startIndex + 2])
        }
    }
}
