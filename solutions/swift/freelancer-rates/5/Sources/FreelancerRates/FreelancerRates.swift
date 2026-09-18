func dailyRateFrom(hourlyRate: Int) -> Double {
   Double(hourlyRate) * 8.0 // 8 Working hours
}

func applyDiscount(to amount: Double, discount: Double) -> Double {
  amount * (1.0 - discount / 100.0)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  let monthlyRate = dailyRateFrom(hourlyRate: hourlyRate) * 22.0 // 22 working days
  return applyDiscount(to: monthlyRate, discount: discount).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let dailyRate = dailyRateFrom(hourlyRate: hourlyRate)
  let discountedDailyRate = applyDiscount(to: dailyRate, discount: discount)
  return (budget / discountedDailyRate).rounded(.down)
}