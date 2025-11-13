enum QueenError: Error {
  case inValidRow, inValidColumn
}

struct Queen {
  let row: Int
  let column: Int
  private static let boardSize = 8

  init(row: Int, column: Int) throws {
    try Queen.validate(row,  error: .inValidRow)
    try Queen.validate(column,  error: .inValidColumn)
    self.row = row
    self.column = column
  }
  
  private static func validate(_ value: Int, error: QueenError) throws {
    guard (0..<boardSize).contains(value) else { throw error }
  }

  func canAttack(other: Queen) -> Bool {
    row == other.row ||
    column == other.column ||
    abs(row - other.row) == abs(column - other.column)
  }
}
