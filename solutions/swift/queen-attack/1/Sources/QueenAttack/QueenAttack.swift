enum QueenError: Error {
    case inValidRow, inValidColumn
}

struct Queen {
    let row: Int
    let column: Int

    init(row: Int, column: Int) throws {
        try Queen.validate(row: row)
        try Queen.validate(column: column)
        self.row = row
        self.column = column
    }
 
    static func validate(row: Int) throws {
        guard (0..<8).contains(row) else {
            throw QueenError.inValidRow
        }
    }

    static func validate(column: Int) throws {
        guard (0..<8).contains(column) else {
            throw QueenError.inValidColumn
        }
    }

    func canAttack(other: Queen) -> Bool {
        row == other.row ||
        column == other.column ||
        abs(row - other.row) == abs(column - other.column)
    }
}
