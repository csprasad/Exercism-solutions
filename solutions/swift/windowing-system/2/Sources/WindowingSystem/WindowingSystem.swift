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
  let screenSize: Size
  var size: Size
  var position: Position
  var contents: String?

  init(title: String = "New Window", size: Size = Size(), position: Position = Position(), contents: String? = nil) {
    self.title = title
    self.screenSize = Size(width: 800, height: 600)
    self.size = size
    self.position = position
    self.contents = contents
  }


  func resize(to newSize: Size) {
    let minWidth = 1
    let minHeight = 1

    let maxWidth = screenSize.width - position.x
    let maxHeight = screenSize.height - position.y

    let newWidth = min(max(newSize.width, minWidth), maxWidth)
    let newHeight = min(max(newSize.height, minHeight), maxHeight)

    size.resize(newWidth: newWidth, newHeight: newHeight)
  }

  func move(to newPosition: Position) {
    let minX = 0
    let minY = 0

    let maxX = screenSize.width - size.width
    let maxY = screenSize.height - size.height

    let newX = min(max(newPosition.x, minX), maxX)
    let newY = min(max(newPosition.y, minY), maxY)

    position.moveTo(newX: newX, newY: newY)
  }

  func update(title: String) {
    self.title = title
  }

  func update(text: String?) {
    self.contents = text
  }

  func display() -> String {
    let positionString = "Position: (\(position.x), \(position.y))"
    let sizeString = "Size: (\(size.width) x \(size.height))"
    let contentsString = contents ?? "[This window intentionally left blank]"
    return "\(title)\n\(positionString), \(sizeString)\n\(contentsString)\n"
  }
}


let mainWindow = Window(title: "Main Window", size: Size(width: 400, height: 300), position: Position(x: 100, y: 100), contents: "This is the main window")