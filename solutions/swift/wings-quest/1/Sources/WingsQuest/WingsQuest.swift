func bonusPoints(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
    // fatalError("Please implement the bonusPoints(powerUpActive:touchingEagle:) function")
    return powerUpActive && touchingEagle == true ? true : false
}

func score(touchingPowerUp: Bool, touchingSeed: Bool) -> Bool {
  // fatalError("Please implement the score(touchingPowerUp:touchingSeed:) function")
    return touchingPowerUp || touchingSeed == true ? true : false
}

func lose(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  // fatalError("Please implement the lose(powerUpActive:touchingEagle:) function")
    return powerUpActive == false && touchingEagle == true ? true : false
}

func win(hasPickedUpAllSeeds: Bool, powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  // fatalError("Please implement the win(hasPickedUpAllSeeds:powerUpActive:touchingEagle:) function")
    return hasPickedUpAllSeeds == true && !lose(powerUpActive: powerUpActive, touchingEagle: touchingEagle) ? true : false

}
