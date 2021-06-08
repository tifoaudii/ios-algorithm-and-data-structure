import UIKit

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct QueueArray<T>: Queue {
    
    private var array: [T] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var peek: T? {
        array.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else {
            return nil
        }
        
        return array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return String(describing: array)
    }
}

var queue = QueueArray<String>()
queue.enqueue("Tono")
queue.enqueue("Tini")
queue.enqueue("Tana")

queue.description
