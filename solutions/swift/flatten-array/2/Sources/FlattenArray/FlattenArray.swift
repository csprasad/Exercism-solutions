func flattenArray<T>(_ list: [Any?]) -> [T] {
    var result: [T] = []
    
    for element in list {
        if let value = element as? T {
            result.append(value)
        } else if let subArray = element as? [Any?] {
            result += flattenArray(subArray)
        }
    }
    return result
}