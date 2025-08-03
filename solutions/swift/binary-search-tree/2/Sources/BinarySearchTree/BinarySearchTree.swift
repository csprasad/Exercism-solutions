class BinarySearchTree {
  let data: Int
  var left: BinarySearchTree?
  var right: BinarySearchTree?

  init(_ data: Int) {
    self.data = data
  }

  func insert(_ newData: Int) {
    if newData > data {
      if let rightNode = right {
        rightNode.insert(newData)
      } else {
        right = BinarySearchTree(newData)
      }
    } else {
      if let leftNode = left {
        leftNode.insert(newData)
      } else {
        left = BinarySearchTree(newData)
      }
    }
  }

  func inOrderTraversal(visit: (Int) -> Void) {
    left?.inOrderTraversal(visit: visit)
    visit(data)
    right?.inOrderTraversal(visit: visit)
  }

  func allData() -> [Int] {
    var result = [Int]()
    inOrderTraversal { result.append($0) }
    return result
  }
}
