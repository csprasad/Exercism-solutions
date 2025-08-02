func getCard(at index: Int, from stack: [Int]) -> Int {
    return stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
    guard index >= 0, index <= stack.count - 1 else {
        return stack
    }

    var newStack = stack
    newStack[index] = newCard
    return newStack
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
    return stack + [newCard]
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
    guard index >= 0, index <= stack.count - 1 else {
        return stack
    }

    var newStack = stack
    newStack.remove(at: index)
    return newStack
}

func removeTopCard(_ stack: [Int]) -> [Int] {
    return removeCard(at: stack.count - 1, from: stack)
}

func insert(_ newCard: Int, atBottomOf stack: [Int]) -> [Int] {
    return [newCard] + stack
}

func removeBottomCard(_ stack: [Int]) -> [Int] {
    return removeCard(at: 0, from: stack)
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
  return stack.count == size
}

func evenCardCount(_ stack: [Int]) -> Int {
  var counter = 0
  for i in stack {
    if i.isMultiple(of: 2) {
    counter += 1 
    } 
  }
  return counter
}
