func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
    expectedMinutesInOven - elapsedMinutes
}

func preparationTimeInMinutes(_ preparationTimePerLayer: Int = 2, layers: String...) -> Int {
    layers.count * preparationTimePerLayer
}

func quantities(_ layersOfNoodles: Int = 3, _ layersOfSauce: Double = 0.2, layers: String...) -> (noodles: Int, sauce: Double) {
    var noodlesQuantity = 0
    var sauceQuantity = 0.0
    
    for layer in layers {
        if layer == "noodles" {
             noodlesQuantity += layersOfNoodles                  
        } else if layer == "sauce" {
             sauceQuantity += layersOfSauce                      
        }   
    }

    return (noodles: noodlesQuantity, sauce: sauceQuantity)
}

func toOz(_ Quantity: inout (noodles: Int, sauce: Double), _ conversionFactor: Double = 33.814) {
    Quantity.sauce = Quantity.sauce * conversionFactor
}

func redWine(layers: String...) -> Bool {
    
    func countMozzarella(_ layer: String = "mozzarella") -> Int {
        layers.filter { $0 == layer }.count
    }

    func countRicotta(_ layer: String = "ricotta") -> Int {
        layers.filter { $0 == layer }.count
    }

    func countBéchamel(_ layer: String = "béchamel") -> Int {
        layers.filter { $0 == layer }.count
    }

    func countSauce(_ layer: String = "sauce") -> Int {
        layers.filter { $0 == layer }.count
    }

    func countMeat(_ layer: String = "meat") -> Int {
        layers.filter { $0 == layer }.count
    }

    let whiteLayers = [countMozzarella(), countRicotta(), countBéchamel()]
    let redLayers = [countMeat(), countSauce()]

    let whiteCount = whiteLayers.reduce(0, +)
    let redCount = redLayers.reduce(0, +)

    return whiteCount <= redCount
}

