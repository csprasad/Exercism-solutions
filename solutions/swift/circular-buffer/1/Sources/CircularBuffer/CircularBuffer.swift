import Foundation

enum CircularBufferError: Error {
  case bufferFull
  case bufferEmpty
}

struct CircularBuffer {
  private var buffer: [Int?]
  private var head = 0
  private var tail = 0
  private(set) var count = 0
  var capacity: Int

  init(capacity: Int) {
    self.capacity = capacity
    buffer = Array(repeating: nil, count: capacity)
  }

  mutating func write(_ element: Int) throws {
    if count == capacity {
      throw CircularBufferError.bufferFull
    }
    buffer[tail] = element
    tail = (tail + 1) % capacity
    count += 1
  }

  mutating func read() throws -> Int {
    if count == 0 {
      throw CircularBufferError.bufferEmpty
    }
    let element = buffer[head]!
    buffer[head] = nil
    head = (head + 1) % capacity
    count -= 1
    return element
  }

  mutating func clear() {
    buffer = Array(repeating: nil, count: capacity)
    head = 0
    tail = 0
    count = 0
  }

  mutating func overwrite(_ element: Int) {
    if count == capacity {
      head = (head + 1) % capacity
    } else {
      count += 1
    }
    buffer[tail] = element
    tail = (tail + 1) % capacity
  }
}
