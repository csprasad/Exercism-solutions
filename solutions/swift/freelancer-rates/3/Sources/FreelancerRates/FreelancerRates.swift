func dailyRateFrom(hourlyRate: Int, workHours: Double = 8) -> Double {
  Double(hourlyRate) * workHours
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double, workDays: Double = 22) -> Double {
  let monthlyRate = dailyRateFrom(hourlyRate: hourlyRate) * workDays
  let discountAmount = monthlyRate * discount / 100
  return (monthlyRate - discountAmount).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let dailyRate = dailyRateFrom(hourlyRate: hourlyRate)
  let discountedRate = dailyRate * (1 - discount/100)
  return (budget / discountedRate).rounded(.down)
}
