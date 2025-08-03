import Foundation

struct Clock: Equatable {
  private var totalMinutes: Int

  init(hours: Int, minutes: Int) {
    self.totalMinutes = ((hours * 60) + minutes) % 1440
    if self.totalMinutes < 0 {
      self.totalMinutes += 1440 
    }
  }

  func add(minutes: Int) -> Clock {
    return Clock(hours: 0, minutes: self.totalMinutes + minutes)
  }

  func subtract(minutes: Int) -> Clock {
    return Clock(hours: 0, minutes: self.totalMinutes - minutes)
  }

  var description: String {
    let hours = (totalMinutes / 60) % 24
    let minutes = totalMinutes % 60
    return String(format: "%02d:%02d", hours, minutes)
  }
}
