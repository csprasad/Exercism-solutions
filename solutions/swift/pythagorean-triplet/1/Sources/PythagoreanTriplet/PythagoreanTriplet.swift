import Foundation

struct Triplet: Equatable, ExpressibleByArrayLiteral {
    let a: Int
    let b: Int
    let c: Int
    
    init(_ a: Int, _ b: Int, _ c: Int) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    init(arrayLiteral elements: Int...) {
        precondition(elements.count == 3, "Triplet requires exactly 3 elements.")
        self.a = elements[0]
        self.b = elements[1]
        self.c = elements[2]
    }
    
    var sum: Int {
        return a + b + c
    }
    
    var product: Int {
        return a * b * c
    }
    
    var isPythagorean: Bool {
        return a * a + b * b == c * c
    }
}

func tripletsWithSum(_ sum: Int) -> [Triplet] {
    var triplets = [Triplet]()
    let halfSum = sum / 2
    let thirdSum = sum / 3
    
    for a in 1..<thirdSum {
        for b in (a + 1)..<halfSum {
            let c = sum - a - b
            if b < c && a * a + b * b == c * c {
                triplets.append(Triplet(a, b, c))
            }
        }
    }
    return triplets
}
