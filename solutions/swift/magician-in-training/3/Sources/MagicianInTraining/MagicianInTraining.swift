func getCard(at index: Int, from stack: [Int]) -> Int {
  stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
  var newStack = stack
  if newStack.indices.contains(index) {
    newStack[index] = newCard
  }
  return newStack
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
  stack + [newCard]
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
  var remainingCards = stack
  if remainingCards.indices.contains(index) {
    remainingCards.remove(at: index)
  }
  return remainingCards
}

func removeTopCard(_ stack: [Int]) -> [Int] {
  removeCard(at: stack.count - 1, from: stack)
}

func insert(_ newCard: Int, atBottomOf stack: [Int]) -> [Int] {
  [newCard] + stack
}

func removeBottomCard(_ stack: [Int]) -> [Int] {
  removeCard(at: 0, from: stack)
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
  stack.count == size
}

func evenCardCount(_ stack: [Int]) -> Int {
  return stack.filter { $0.isMultiple(of: 2) }.count
}
