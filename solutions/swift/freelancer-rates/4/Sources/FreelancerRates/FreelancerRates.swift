
func dailyRateFrom(hourlyRate: Int, workHours: Double = 8) -> Double {
  return Double(hourlyRate) * workHours
}

func applyDiscount(to amount: Double, discount: Double) -> Double {
  return amount * (1 - discount / 100)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double, workDays: Double = 22) -> Double {
  let monthlyRate = dailyRateFrom(hourlyRate: hourlyRate) * workDays
  return applyDiscount(to: monthlyRate, discount: discount).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let dailyRate = dailyRateFrom(hourlyRate: hourlyRate)
  let discountedDailyRate = applyDiscount(to: dailyRate, discount: discount)
  return (budget / discountedDailyRate).rounded(.down)
}