func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
    expectedMinutesInOven - elapsedMinutes
}

func preparationTimeInMinutes(_ preparationTimePerLayer: Int = 2, layers: String...) -> Int {
    layers.count * preparationTimePerLayer
}

let quantitiesMap: [String: Double] = [
    "noodles": 3.0,
    "sauce": 0.2
]

func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
    (
        noodles: layers.filter { $0 == "noodles" }.count * Int(quantitiesMap["noodles"]!),
        sauce: Double(layers.filter { $0 == "sauce" }.count) * quantitiesMap["sauce"]!
    )
}

func toOz(_ Quantity: inout (noodles: Int, sauce: Double), _ conversionFactor: Double = 33.814) {
    Quantity.sauce = Quantity.sauce * conversionFactor
}

func redWine(layers: String...) -> Bool {
  layers.filter({ ["sauce", "meat"].contains($0) }).count
    >= layers.filter({ ["mozzarella", "ricotta", "béchamel"].contains($0) }).count
}