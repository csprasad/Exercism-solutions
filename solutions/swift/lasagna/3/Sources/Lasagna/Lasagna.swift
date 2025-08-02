let expectedMinutesInOven = 40

func remainingMinutesInOven(elapsedMinutes: Int) -> Int {
    expectedMinutesInOven - elapsedMinutes
}

func preparationTimeInMinutes(layers: Int, _ preparationTimePerLayer: Int = 2) -> Int {
    layers * preparationTimePerLayer
}

func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int {
    preparationTimeInMinutes(layers: layers) + elapsedMinutes
}