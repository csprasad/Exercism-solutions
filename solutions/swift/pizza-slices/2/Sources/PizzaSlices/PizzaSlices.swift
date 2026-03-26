import Foundation

private let aBigger = "Slice A is bigger"
private let bBigger = "Slice B is bigger"
private let neutral = "Neither slice is bigger"

func sliceSize(diameter: Double?, slices: Int?) -> Double? {
      guard let diameter = diameter, 
            let slices = slices, 
            diameter >= 0, 
            slices > 0 
            else { return nil}
    let r = diameter / 2
    return .pi * r * r / Double(slices)
}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
) -> String {
    let sliceA = sliceSize(diameter: Double(diameterA), slices: Int(slicesA))
    let sliceB = sliceSize(diameter: Double(diameterB), slices: Int(slicesB))
    
    switch(sliceA, sliceB) {
      case let (.some(a), .some(b)):
        if a == b { return neutral }
        return a > b ? aBigger : bBigger
      case (.some, .none): 
        return aBigger
      case (.none,  .some): 
        return bBigger
      case (.none, .none): 
        return neutral
    }
}
