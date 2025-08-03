func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
    let totalBudget = monthlyBudget * 5 * 12
    let frugalBudget = totalBudget + monthlyBudget * 10

    if price <= totalBudget {
        return "Yes! I'm getting a \(vehicle)"
    } else if price <= frugalBudget {
        return "I'll have to be frugal if I want a \(vehicle)"
    } else {
        return "Darn! No \(vehicle) for me"
    }
}

func licenseType(numberOfWheels wheels: Int) -> String {
  switch wheels {
        case 2,3:
            return "You will need a motorcycle license for your vehicle"
        case 4,6:
            return "You will need an automobile license for your vehicle"
        case 18:
            return "You will need a commercial trucking license for your vehicle"
      default: 
            return "We do not issue licenses for those types of vehicles"
  }
}

func calculateResellPrice(originalPrice: Double, yearsOld: Int) -> Double {
    let resellPrice: Double
    
    if yearsOld < 3 {
        resellPrice = originalPrice * 0.8
    } else if yearsOld >= 10 {
        resellPrice = originalPrice * 0.5
    } else {
        resellPrice = originalPrice * 0.7
    }
    
    return resellPrice
}
