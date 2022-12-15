//
//  LinkedList.swift
//  BaekJoon
//
//  Created by Bibi on 2022/10/06.
//

import Foundation

class Node<T>: CustomStringConvertible, Equatable {
    
    var value: T
    var next: Node?
    
    var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> " + String(describing: next)
    }
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.next == rhs.next
    }
}

struct LinkedList<T>: CustomStringConvertible {
    
    var head: Node<T>?
    var tail: Node<T>?
    
    init() { }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var description: String {
        guard let head = head else { return "Empty list" }
        return String(describing: head)
    }
}

extension LinkedList {
    func node(at index: Int) -> Node<T>? {
        if isEmpty {
            return nil
        }
        
        var currentNode = head
        var currentIndex = 0
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    func count() -> Int {
        var currentNode = head
        var count = 0
        while currentNode != nil {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }
    
    mutating func push(_ value: T) {
        
        let newNode = Node(value: value, next: head)
        
        head = newNode
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: T) {
        
        if isEmpty {
            self.push(value)
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    mutating func insert(_ value: T, after index: Int) {
        
        if index < 0 || index >= self.count() {
            self.append(value)
            return
        }
        
        if let beforeNode = self.node(at: index), let tail = tail {
            if beforeNode == tail {
                self.append(value)
            } else {
                beforeNode.next = Node(value: value, next: beforeNode.next)
            }
        } else {
            self.push(value)
        }
    }
    
    @discardableResult
    mutating func pop() -> T? {
        
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    mutating func removeLast() -> T? {
        
        guard let head = head else { return nil }
        
        guard head.next != nil else { return pop() }
        
        var currentNode = head
        var previousNode = head
        
        while let next = currentNode.next {
            previousNode = currentNode
            currentNode = next
        }
        
        previousNode.next = nil
        tail = previousNode
        return currentNode.value
    }
    
    mutating func remove(after index: Int) -> T? {
        
        if index < 0 || index >= self.count() {
            return nil
        }
        
        if let beforeNode = self.node(at: index) {
            defer {
                if beforeNode.next == tail {
                    tail = beforeNode
                }
                beforeNode.next = beforeNode.next?.next
            }
            return beforeNode.next?.value
        }
        return nil
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
