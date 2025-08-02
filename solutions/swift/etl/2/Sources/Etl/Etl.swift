class ETL {
  static func transform(_ old: [String: [String]]) -> [String: Int] {
    old.reduce(into: [:]) { result, pair in
      let (key, values) = pair
      values.forEach { result[$0.lowercased()] = Int(key) }
    }
  }
}
