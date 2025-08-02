enum ClasifierType {
  case equal, sublist, superlist, unequal
}

func classifier(listOne a: [Int], listTwo b: [Int]) -> ClasifierType {
    if a == b { return .equal } 
    if a.contains(b) { return .superlist } 
    if b.contains(a) { return .sublist } 
    return .unequal
}