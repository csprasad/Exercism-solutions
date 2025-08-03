import Foundation

func sliceSize(diameter: Double?, slices: Int?) -> Double? {
      guard let diameter = diameter, 
            let slices = slices, 
            diameter >= 0, 
            slices > 0 
            else { return nil}
    let r = diameter / 2
    return .pi * pow(r, 2) / Double(slices)
}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
) -> String {
      let sliceA = sliceSize(diameter: Double(diameterA), slices: Int(slicesA))
    let sliceB = sliceSize(diameter: Double(diameterB), slices: Int(slicesB))
    
    guard sliceA != sliceB else { return "Neither slice is bigger" }
    guard let sliceA = sliceA else { return "Slice B is bigger" }
    guard let sliceB = sliceB else { return "Slice A is bigger" }
    return sliceA > sliceB ? "Slice A is bigger" : "Slice B is bigger"
}
