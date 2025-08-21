func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
  let monthsToSave = 60.0 // 5 years * 12 months
  let extraFrugalMonths = 10.0 // +10 extra months

  let totalBudget = monthlyBudget * monthsToSave
  let frugalBudget = monthlyBudget * (monthsToSave + extraFrugalMonths)

  return price <= totalBudget ? "Yes! I'm getting a \(vehicle)" :
         price <= frugalBudget ? "I'll have to be frugal if I want a \(vehicle)" :
         "Darn! No \(vehicle) for me"
}

func licenseType(numberOfWheels wheels: Int) -> String {
  switch wheels {
    case 2, 3: "You will need a motorcycle license for your vehicle"
    case 4, 6: "You will need an automobile license for your vehicle"
    case 18: "You will need a commercial trucking license for your vehicle"
    default: "We do not issue licenses for those types of vehicles"
  }
}

func calculateResellPrice(originalPrice: Double, yearsOld: Int) -> Double {
  enum Constants {
    static let newRate = 0.8    // <3 years
    static let midRate = 0.7    // 3-9 years 
    static let oldRate = 0.5    // 10+ years
  }

  let rate = yearsOld < 3 ? Constants.newRate : 
             yearsOld >= 10 ? Constants.oldRate : 
             Constants.midRate

  return originalPrice * rate
}