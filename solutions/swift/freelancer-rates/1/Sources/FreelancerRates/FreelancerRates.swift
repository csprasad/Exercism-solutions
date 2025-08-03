func dailyRateFrom(hourlyRate: Int) -> Double {
  return Double(hourlyRate * 8)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
      let monthly = dailyRateFrom(hourlyRate: hourlyRate) * Double(22)
    return Double(monthly - (discount/100) * monthly).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  return Double(budget / (dailyRateFrom(hourlyRate: hourlyRate) * (1.0 - discount/100.0))).rounded(.down)

}
