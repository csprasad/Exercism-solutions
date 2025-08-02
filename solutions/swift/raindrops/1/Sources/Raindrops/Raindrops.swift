func raindrops(_ number: Int) -> String {
  // Write your code for the 'Raindrops' exercise in this file.
  var result = ""

  if number % 3 == 0 {
    result += "Pling"
  } 
  if number % 5 == 0 {
    result += "Plang"
  }
  if number % 7 == 0 {
    result += "Plong"
  }

  return result.count <= 0 ? "\(number)" : result
}
