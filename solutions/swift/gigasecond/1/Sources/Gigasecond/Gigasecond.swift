import Foundation

func gigasecond(from: Date) -> Date {
    let gigasecond = 1_000_000_000.0
    return from.addingTimeInterval(gigasecond)
}
