func timeToPrepare(drinks: [String]) -> Double {
    var timeTaken = 0.0
    for drink in drinks {
        switch drink {
            case "beer", "soda", "water":
                timeTaken += 0.5  
            case "shot":
                timeTaken += 1.0  
            case "mixed drink":
                timeTaken += 1.5 
            case "fancy drink":
                timeTaken += 2.5  
            case "frozen drink":
                timeTaken += 3.0  
            default:
                break 
        }
    }
    return timeTaken 
}

func makeWedges(needed: Int, limes: [String]) -> Int {
    var wedgesNeeded = needed
    var limeCut = 0
    var limesArr = limes

    while wedgesNeeded > 0 && !limesArr.isEmpty {
        let lime = limesArr.removeFirst()
        switch lime {
            case "small":
                wedgesNeeded -= 6
            case "medium":
                wedgesNeeded -= 8
            case "large":
                wedgesNeeded -= 10
            default:
                break
        }
        limeCut += 1
    }

    return limeCut
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
    var leftOverOrders: [[String]] = remainingOrders
    var timeLeft = Double(minutesLeft)
    
    repeat {
        let order = leftOverOrders.removeFirst()
        timeLeft -= timeToPrepare(drinks: order)
    } while timeLeft > 0.0 && !leftOverOrders.isEmpty

    return leftOverOrders
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
  beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
) {
    if orders.isEmpty {
        return (beer: nil, soda: nil)    
    }

    var beerOrderTime = [String]()
    var sodaOrderTime = [String]()
  
    for order in orders {
        switch order.drink {
            case "beer":
            beerOrderTime.append(order.time)
            case "soda":
            sodaOrderTime.append(order.time)
            default:
            break
        }
    }

    let defaultTuple = (first: "", last: "", total: 0)

    let beerTuple = (
        first: beerOrderTime.first ?? defaultTuple.first,
        last: beerOrderTime.last ?? defaultTuple.last,
        total: beerOrderTime.count
    )

    let sodaTuple = (
        first: sodaOrderTime.first ?? defaultTuple.first,
        last: sodaOrderTime.last ?? defaultTuple.last,
        total: sodaOrderTime.count
    )

    if beerOrderTime.isEmpty {
        return (beer: nil, soda: sodaTuple)
    } else if sodaOrderTime.isEmpty {
        return (beer: beerTuple, soda: nil)
    } else {
        return (beer: beerTuple, soda: sodaTuple)
    }
}
