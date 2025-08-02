import Foundation

typealias Wires = (String, String, String)

let flip: (Wires) -> Wires = { (wires) in
    (wires.1, wires.0, wires.2)
}

let rotate: (Wires) -> Wires = { (wires) in
    (wires.1, wires.2, wires.0)
}

func makeShuffle(
    flipper: @escaping (Wires) -> Wires,
    rotator: @escaping (Wires) -> Wires
) -> (UInt8, Wires) -> Wires {
    
    return { id, wires in
        var shuffledWires = wires
        
        for i in 0..<8 {
            let isBitSet = (id & (1 << i)) != 0
            shuffledWires = isBitSet ? rotator(shuffledWires) : flipper(shuffledWires)
        }
        
        return shuffledWires
    }
}