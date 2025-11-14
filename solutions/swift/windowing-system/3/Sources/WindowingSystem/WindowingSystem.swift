struct Size {
  var width = 80
  var height = 60

  mutating func resize(newWidth: Int, newHeight: Int) {
    width = newWidth
    height = newHeight
  }
}

struct Position {
  var x = 0
  var y = 0

  mutating func moveTo(newX: Int, newY: Int) {
    x = newX
    y = newY
  }
}

class Window {
  var title: String
  var contents: String?
  var size: Size
  var position: Position
  var screenSize: Size

  init(
    title: String = "New Window",
    contents: String? = nil,
    size: Size = Size(),
    position: Position = Position(),
    screenSize: Size = Size(width: 800, height: 600)
  ) {
    self.title = title
    self.contents = contents
    self.size = size
    self.position = position
    self.screenSize = screenSize

    resize(to: size)
    move(to: position)
  }

  // Resize
  func resize(to newSize: Size) {
    let w = max(1, min(newSize.width,  screenSize.width  - position.x))
    let h = max(1, min(newSize.height, screenSize.height - position.y))

    size = Size(width: w, height: h)
  }

  // Move
  func move(to newPos: Position) {
    let x = max(0, min(newPos.x, screenSize.width  - size.width))
    let y = max(0, min(newPos.y, screenSize.height - size.height))

    position = Position(x: x, y: y)
  }

  // Update
  func update(title: String) {
    self.title = title
  }

  func update(text: String?) {
    contents = text ?? "[This window intentionally left blank]"
  }

  // Display
  func display() -> String {
    let body = contents ?? "[This window intentionally left blank]"
    
    return """
    \(title)
    Position: (\(position.x), \(position.y)), Size: (\(size.width) x \(size.height))
    \(body)
    
    """
  }
}
