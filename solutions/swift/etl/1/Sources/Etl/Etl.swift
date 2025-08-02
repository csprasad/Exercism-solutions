class ETL {
  static func transform(_ old: [String: [String]]) -> [String: Int] {
    var result: [String: Int] = [:]

    for (key, value) in old {
        for j in value {
           result[j.lowercased()] = Int(key)
        }
    }
      
    return result
  }
}
