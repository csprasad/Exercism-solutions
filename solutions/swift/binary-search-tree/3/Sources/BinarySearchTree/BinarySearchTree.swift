

class BinarySearchTree<T: Comparable> {
  let data: T
  var left: BinarySearchTree?
  var right: BinarySearchTree?

  init(_ data: T) {
    self.data = data
  }

  func insert(_ newData: T) {
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

  private func inOrderTraversal(visit: (T) -> Void) {
    left?.inOrderTraversal(visit: visit)
    visit(data)
    right?.inOrderTraversal(visit: visit)
  }

  func allData() -> [T] {
    var result = [T]()
    inOrderTraversal { result.append($0) }
    return result
  }
}
