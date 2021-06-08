import UIKit

final class Node<Value> {
    
    let value: Value
    
    var next: Node<Value>?
    
    init(value: Value, next: Node<Value>? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next)
    }
}

final class LinkedList<Value> {
    
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    public init(head: Node<Value>? = nil) {
        self.head = head
    }
    
    public func push(value: Value) {
        let newNode = Node<Value>(value: value)
        
        guard !isEmpty else {
            head = newNode
            tail = head
            return
        }
        
        newNode.next = head
        head = newNode
    }
    
    public func append(value: Value) {
        let newNode = Node<Value>(value: value)
        
        guard !isEmpty else {
            push(value: value)
            return
        }
        
        var current = head
        
        while current != nil {
            guard current?.next != nil else {
                current?.next = newNode
                tail = newNode
                return
            }
            
            current = current?.next
        }
    }
    
    public func insert(at index: Int, value: Value) {
        
        guard index > 0, !isEmpty else {
            push(value: value)
            return
        }
        
        let newNode = Node<Value>(value: value)
        
        var current = head
        var prev = current
        var counter: Int = 0
        
        while current != nil {
            
            guard index != counter else {
                newNode.next = current
                prev?.next = newNode
                return
            }
            
            guard current?.next != nil else {
                current?.next = newNode
                tail = newNode
                return
            }
            
            prev = current
            current = current?.next
            counter += 1
        }
    }
    
    public func delete(at index: Int) {
        guard !isEmpty else {
            print("Linked list already empty")
            return
        }
        
        guard index > 0 else {
            head = head?.next
            return
        }
        
        var current = head
        var prev = current
        var counter: Int = 0
        
        while current != nil {
            
            guard index != counter else {
                prev?.next = current?.next
                current = nil
                return
            }
            
            guard current?.next != nil else {
                print("index not found")
                return
            }
            
            prev = current
            current = current?.next
            counter += 1
        }
    }
    
    public func getMiddleNode() -> Node<Value>? {
        guard !isEmpty else {
            return head
        }
        
        var fastTraversal = head
        var slowTraversal = head
        
        while let fastTraversalNext = fastTraversal?.next {
            fastTraversal = fastTraversalNext.next
            slowTraversal = slowTraversal?.next
        }
        
        return slowTraversal
    }
    
    // 1 2 3 4 5
    
    public func reverse() {
        tail = head
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        head = prev
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty"
        }
        
        return String(describing: head)
    }
}

let ll = LinkedList<Int>()
ll.append(value: 1)
ll.append(value: 2)
ll.append(value: 3)
ll.append(value: 4)

print(ll)
ll.reverse()
print(ll)
