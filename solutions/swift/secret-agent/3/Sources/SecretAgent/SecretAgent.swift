func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
      func checkPassword(_ code: String) -> String {
        code == password ? secret : "Sorry. No hidden secrets here."
      }
    return checkPassword
}

func generateCombination(forRoom room: Int, usingFunction generator: (Int) -> Int) -> (Int, Int, Int) {
    let firstNumber = generator(room)
    let secondNumber = generator(firstNumber)
    let thirdNumber = generator(secondNumber)
    return (firstNumber, secondNumber, thirdNumber)
}
