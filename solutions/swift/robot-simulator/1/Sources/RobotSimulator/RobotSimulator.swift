import Foundation

enum Bearing: CaseIterable {
  case north, east, south, west

  func turn(_ direction: TurnDirection) -> Bearing {
    let bearings = Bearing.allCases
    let currentIndex = bearings.firstIndex(of: self)!

    switch direction {
      case .left:
      return bearings[(currentIndex + 3) % 4]
      case .right:
      return bearings[(currentIndex + 1) % 4]
    }
  }
}

enum TurnDirection {
  case left, right
}

struct RobotState {
  var x: Int
  var y: Int
  var bearing: Bearing
}

class SimulatedRobot {
  var state: RobotState

  init(x: Int, y: Int, bearing: Bearing) {
    self.state = RobotState(x: x, y: y, bearing: bearing)
  }

  func move(commands: String) {
    for command in commands {
      switch command {
        case "R":
        state.bearing = state.bearing.turn(.right)
        case "L":
        state.bearing = state.bearing.turn(.left)
        case "A":
        advance()
        default:
        continue
      }
    }
  }

  private func advance() {
    switch state.bearing {
      case .north: state.y += 1
      case .south: state.y -= 1
      case .east: state.x += 1
      case .west: state.x -= 1
    }
  }

  var currentState: RobotState {
    return state
  }
}
