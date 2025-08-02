func flattenArray(_ list: [Any?]) -> [Int] {
  var result: [Int] = []
    
    for element in list {
        if let number = element as? Int {
            result.append(number)
        } else if let subArray = element as? [Any?] {
            result += flattenArray(subArray)
        }
    }
    
    return result
}