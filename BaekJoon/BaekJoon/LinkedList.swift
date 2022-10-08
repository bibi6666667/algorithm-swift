//
//  LinkedList.swift
//  BaekJoon
//
//  Created by Bibi on 2022/10/06.
//

import Foundation

public class LinkedListNode<T> {
    public var value: T
    public var next: LinkedListNode?
    
    public init(value: T, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
}

public struct LinkedList<T> {
    
    public typealias Node = LinkedListNode<T>
    
    public var head: Node?
    public var tail: Node?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    // node(at:) : O(i), i=index. 특정 인덱스의 노드를 찾기
    public func node(at index: Int) -> Node? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        // 목록이 비어있거나 인덱스를 넘어가면 nil 반환
        return currentNode
    }
    
    // MARK: Adding 삽입
    
    // push : O(1), 맨 처음에 삽입 head-first insertion
    public mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        if tail == nil { // 빈 연결리스트에 넣은 경우 첫 요소가 head 이자 tail임
            tail = head
        }
    }
    
    // append: O(1), 맨 뒤에 삽입 tail-end insertion
    public mutating func append(_ value: T) {
        if isEmpty { // 비어 있는 배열에 넣을 때는 push == append
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    @discardableResult // 리턴값을 사용하지 않더라도 컴파일러가 경고를 보내지 않게 함
    // insert(_:after:) : O(1), 해당 노드 뒤에 삽입.
    public mutating func insert(_ value: T, after node: Node) -> Node {
        guard tail !== node else { // 참조 비교
            // node가 tail인 경우 insert == append
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    // MARK: Removing 삭제
    
    // pop : O(1). 맨 앞에서 제거.
    @discardableResult
    public mutating func pop() -> T? {
        defer { // 함수 종료 직전에 실행
            head = head?.next // head 제거 - 참조가 없으므로
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    // removeLast() : O(n). 맨 뒤에서 제거.
    @discardableResult
    public mutating func removeLast() -> T? {
        guard let head = head else { // 비어있을 때
            return nil
        }
        
        guard head.next != nil else { // 노드가 1개뿐일때
            return pop()
        }
        
        // 노드가 2개이상일때 : 맨 끝 노드를 찾아야 함
        var prev = head
        var current = head
        while let next = current.next { // next가 nil이 아니면 반복
            prev = current
            current = next
        }
        // 여기에 도달하면 current가 마지막 노드가 된다.
        // 마지막 노드에 대한 참조를 없애 삭제한다
        prev.next = nil // 메모리에서 해제
        tail = prev
        return current.value
    }
    
    // remove(after:) : O(1). 특정 위치의 특정 노드를 삭제
    // 삭제 노드의 앞 노드와 뒷 노드를 이어붙여준다
    @discardableResult
    public mutating func remove(after node: Node) -> T? {
        // node == 삭제할 노드의 앞 노드
        defer {
            if node.next === tail { // tail 앞 노드 삭제 시
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

extension LinkedListNode: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

extension LinkedList: CustomStringConvertible {

  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}
