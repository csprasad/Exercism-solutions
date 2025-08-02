func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
    let check = monthlyBudget * 5 * 12
    if check >= price {
        return "Yes! I'm getting a \(vehicle)"
    } else if check + monthlyBudget * 10 >= price  {
        return "I'll have to be frugal if I want a \(vehicle)"
    } else {
         return "Darn! No \(vehicle) for me"  
    }
}

func licenseType(numberOfWheels wheels: Int) -> String {
  switch wheels {
        case 2,3:
          return "You will need a motorcycle license for your vehicle"
        case 6:
            return "You will need an automobile license for your vehicle"
        case 18:
            return "You will need a commercial trucking license for your vehicle"
      default: 
          return "We do not issue licenses for those types of vehicles"
  }
}

func registrationFee(msrp: Int, yearsOld: Int) -> Int {
  if yearsOld >= 10 { //Old cars
     return 25
  } else {    //New Cars
      let newBasePrice = msrp >= 25000 ? msrp : 25000
      let actualPriceAfterSubstract = Double(newBasePrice) * (1 - 0.1 * Double(yearsOld)) / 100
      return Int(actualPriceAfterSubstract)
  }
}
