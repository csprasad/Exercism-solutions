import Foundation

enum clasifierType {
  case equal
  case sublist
  case superlist
  case unequal
}

func classifier(listOne: [Int], listTwo: [Int]) -> clasifierType {
    if listOne == listTwo { return .equal } 
    if listOne.isEmpty { return .sublist } 
    if listTwo.isEmpty { return .superlist } 
    if isSublist(listOne, of: listTwo) { return .sublist } 
    if isSublist(listTwo, of: listOne) { return .superlist } 
    return .unequal
}

func isSublist<T: Equatable>(_ small: [T], of big: [T]) -> Bool {
    guard !small.isEmpty, small.count <= big.count else { return false }

    for i in 0...(big.count - small.count) {
        if big[i..<(i + small.count)].elementsEqual(small) {
            return true
        }
    }
    return false
}