import UIKit

//class Stack<Element>: ExpressibleByArrayLiteral {
//
//    private var storage: [Element] = []
//
//    public var isEmpty: Bool {
//        return peek() == nil
//    }
//
//    public init(storage: [Element]) {
//        self.storage = storage
//    }
//
//    required public init (arrayLiteral storage: Element...) {
//        self.storage = storage
//    }
//
//    public func push(element: Element) {
//        storage.append(element)
//    }
//
//    public func peek() -> Element? {
//        storage.last
//    }
//
//    @discardableResult
//    public func pop() -> Element? {
//        storage.popLast()
//    }
//
//    public func getValue() {
//        print(storage)
//    }
//
//    public func balanceParentheses(input: String) -> Bool {
//
//        for char in input {
//            if char == "(" {
//                push(element: char as! Element)
//            } else if char == ")" {
//                pop()
//            }
//        }
//
//        return storage.isEmpty
//
//    }
//
//    public func reverse(_ array: [Element]) {
//        for value in array {
//            push(element: value)
//        }
//
//        while let popped = pop() {
//            print(popped)
//        }
//    }
//}
//
//
//let stack: Stack = [1,2,3,4,5]
//stack.reverse([1,2,3,4,5])

public class Stack<Element> {
    
    private var storage: [Element] = []
    
    public var isEmpty: Bool {
        return peek() == nil
    }
    
    init(storage: [Element] = []) {
        self.storage = storage
    }
    
    public func push(_ element: Element) {
        storage.append(element)
    }
    
    public func pop() {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public func printData() {
        print(storage)
    }
}

func isBalanced(s: String) -> String {
    let stack = Stack<Character>()
    
    for char in s {
        
        if char == "{" || char == "(" || char == "[" {
            stack.push(char)
        } else {
            if char == "}" {
                if let last = stack.peek() as? Character, last == "{" {
                    stack.pop()
                } else {
                    return "NO"
                }
            } else if char == ")" {
                if let last = stack.peek() as? Character, last == "(" {
                    stack.pop()
                } else {
                    return "NO"
                }
            } else if char == "]" {
                if let last = stack.peek() as? Character, last == "[" {
                    stack.pop()
                } else {
                    return "NO"
                }
            }
        }
    }

    print(stack.isEmpty)
    return stack.isEmpty ? "YES" : "NO"
}

isBalanced(s: "}][}}(}][))]")

