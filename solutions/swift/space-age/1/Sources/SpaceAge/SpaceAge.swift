class SpaceAge {
    private let seconds: Double
    private let earthOrbitalPeriod: Double = 31_557_600.0

    init(_ seconds: Double) {
        self.seconds = seconds
    }

    private func age(on orbitalPeriod: Double) -> Double {
        return (seconds / earthOrbitalPeriod) / orbitalPeriod
    }

    var onEarth: Double {
        return age(on: 1.0)
    }

    var onMercury: Double {
        return age(on: 0.2408467)
    }

    var onVenus: Double {
        return age(on: 0.61519726)
    }

    var onMars: Double {
        return age(on: 1.8808158)
    }

    var onJupiter: Double {
        return age(on: 11.862615)
    }

    var onSaturn: Double {
        return age(on: 29.447498)
    }

    var onUranus: Double {
        return age(on: 84.016846)
    }

    var onNeptune: Double {
        return age(on: 164.79132)
    }
}
