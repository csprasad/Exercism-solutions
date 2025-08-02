class Triangle {
    private let a: Double
    private let b: Double
    private let c: Double
    
    init(_ sides: [Double]) {
        let sortedSides = sides.sorted() 
        self.a = sortedSides[0]
        self.b = sortedSides[1]
        self.c = sortedSides[2]
    }
    
    private var isValid: Bool {
        return a > 0 && a + b >= c
    }
    
    var isEquilateral: Bool {
        return isValid && a == b && b == c
    }
    
    var isIsosceles: Bool {
        return isValid && (a == b || b == c || a == c)
    }
    
    var isScalene: Bool {
        return isValid && a != b && b != c && a != c
    }
}
