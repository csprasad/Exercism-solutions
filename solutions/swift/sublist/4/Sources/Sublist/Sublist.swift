enum ClassifierType {
  case equal, sublist, superlist, unequal
}

func classifier(listOne a: [Int], listTwo b: [Int]) -> ClassifierType {
    if a == b { return .equal } 
    if a.contains(b) { return .superlist } 
    if b.contains(a) { return .sublist } 
    return .unequal
}