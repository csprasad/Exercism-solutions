import Foundation

func cartesianToPolar(_ cart: (x: Double, y: Double)) -> (r: Double, phi: Double) {
  return (r: hypot(cart.x, cart.y), phi: atan2(cart.y, cart.x))
}

func combineRecords(
  production: (toy: String, id: Int, productLead: String),
  gifts: (Int, [String])
) -> (id: Int, toy: String, productLead: String, recipients: [String]) {

    // guard production.id == gifts.0 else { return production}
    
  return (id: production.id, toy: production.toy, productLead: production.productLead, recipients: gifts.1)
}
