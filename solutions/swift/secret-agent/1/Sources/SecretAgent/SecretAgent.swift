func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
      func checkPassword(_ code: String) -> String {
            guard code == password else {
                return "Sorry. No hidden secrets here."
            }
          return secret
      }

    return checkPassword
}

func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {
    let one = f(room)
    let two = f(one)
    let three = f(two)
    return (one,two,three)
}
