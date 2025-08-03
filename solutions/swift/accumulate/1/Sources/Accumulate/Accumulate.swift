//Solution goes in Sources
extension Array {
    func accumulate<T>(_ transform: (Element) -> T) -> [T] {
        var result: [T] = []
        for element in self {
            result.append(transform(element))
        }
        return result
    }
}
