//Solution goes in Sources
class ListOps {

    static func append<T>(_ list1: [T], _ list2: [T]) -> [T] {
        list1 + list2
    }

    static func concat<T>(_ lists: [T]...) -> [T] {
        var result: [T] = []
        for list in lists {
            result += list
        }
        return result
    }

    static func filter<T>(_ list: [T], _ predicate: (T) -> Bool) -> [T] {
        var result: [T] = []

        for item in list {
            if predicate(item) {
                result += [item]
            }
        }
        return result 
    }

    static func length<T>(_ list: [T]) -> Int {
        var count = 0
        for _ in list {
            count += 1
        }
        return count
    }

    static func map<T, U>(_ list: [T], _ change: (T) -> U) -> [U] {
        var result: [U] = []
        for item in list {
            result += [change(item)]
        }
        return result
    }

    static func foldLeft<T, U>(_ list: [T], accumulated: U, combine: (U,T) -> U) -> U {
        var accumulator = accumulated
        for item in list {
            accumulator = combine(accumulator, item)
        } 
        return accumulator
    }

    static func foldRight<T, U>(_ list: [T], accumulated: U, combine: (T,U) -> U) -> U {
        var accumulator = accumulated
        for item in list.reversed() {
            accumulator = combine(item, accumulator)
        } 
        return accumulator
    }
    

    static func reverse<T>(_ list: [T]) -> [T] {
        var result: [T] = []
        for item in list.reversed() {
            result.append(item)
        }
        return result 
    }
    
}