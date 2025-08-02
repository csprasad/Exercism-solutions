import Foundation

func isArmstrongNumber(_ number: Int) -> Bool {
  guard number >= 10 else { return true }
  
  let digitCount = String(number).count
  var remainingNumber = number
  var armstrongSum = 0

  while remainingNumber > 0 {
    let lastDigit = remainingNumber % 10
    armstrongSum += Int(pow(Double(lastDigit), Double(digitCount)))
    remainingNumber /= 10
  }
  return armstrongSum == number
}
