enum BinarySearchError: Error {
    case valueNotFound
}


class BinarySearch {
    private let array: [Int]

    init(_ array: [Int]) {
        self.array = array
    }

    func searchFor(_ value: Int) throws -> Int {
        var low = 0
        var high = array.count - 1
        
        while low <= high {
            let mid = (low + high) / 2
            
            if array[mid] == value {
                return mid
            } else if array[mid] < value {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        throw BinarySearchError.valueNotFound
    }
}
