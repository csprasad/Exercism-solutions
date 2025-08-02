let timeToPrepareDict: [String: Double] = [
  "water": 0.5,
  "soda": 0.5,
  "beer": 0.5,
  "shot": 1.0,
  "mixed drink": 1.5,
  "fancy drink": 2.5,
  "frozen drink": 3.0
]

let wedgesCount: [String: Int] = [
  "small": 6, 
  "medium": 8, 
  "large": 10
]

typealias Orders = [(drink: String, time: String)]

func timeToPrepare(drinks: [String]) -> Double {
    drinks.reduce(0, { acc, drink in
    acc + (timeToPrepareDict[drink] ?? 0.0)
  })
}

func makeWedges(needed: Int, limes: [String]) -> Int {
    var total = 0
  return limes.compactMap({ wedgesCount[$0] }).filter({
      guard total < needed else { return false }
      total += $0
      return true
  }).count
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
    var leftOverOrders: [[String]] = remainingOrders
    var timeLeft = Double(minutesLeft)
    
    while timeLeft > 0, !leftOverOrders.isEmpty {
        timeLeft -= timeToPrepare(drinks: leftOverOrders.removeFirst())
    } 

    return leftOverOrders
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
  beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
) {
    (prepared(of: "beer", from: orders), prepared(of: "soda", from: orders))
}

private func times(of type: String, from orders: Orders) -> [String] {
    orders.filter { $0.drink == type }.map { $0.time }.sorted()
}

private func prepared(of type: String, from orders: Orders) -> (first: String, last: String, total: Int)? {
    let time = times(of: type, from: orders)
    guard let first = time.first, let last = time.last else { return nil }
    return (first, last, time.count)
}
