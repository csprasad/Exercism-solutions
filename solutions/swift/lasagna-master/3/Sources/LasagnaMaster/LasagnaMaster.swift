func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
    expectedMinutesInOven - elapsedMinutes
}

func preparationTimeInMinutes(_ preparationTimePerLayer: Int = 2, layers: String...) -> Int {
    layers.count * preparationTimePerLayer
}

enum LayerQuantity {
    static let noodlesPerLayer = 3
    static let saucePerLayer = 0.2
}

func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
    (
        noodles: layers.filter { $0 == "noodles" }.count * LayerQuantity.noodlesPerLayer,
        sauce: Double(layers.filter { $0 == "sauce" }.count) * LayerQuantity.saucePerLayer
    )
}

func toOz(_ Quantity: inout (noodles: Int, sauce: Double), _ conversionFactor: Double = 33.814) {
    Quantity.sauce *= conversionFactor
}

func redWine(layers: String...) -> Bool {
  layers.filter({ ["sauce", "meat"].contains($0) }).count
    >= layers.filter({ ["mozzarella", "ricotta", "béchamel"].contains($0) }).count
}