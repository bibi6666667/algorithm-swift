//
//  LinkedList.swift
//  BaekJoon
//
//  Created by Bibi on 2022/10/06.
//

import Foundation

public class Node<T> {
    var value: T
    var next: Node<T>? // 마지막 노드의 next는 nil이 되므로
    weak var previous: Node<T>? // 순환참조 방지
    // weak 없으면 A-B일 때 A는 next로 B를, B도 previous로 A를 참조하게 됨
    
    init(value: T) {
        self.value = value
    }
}

public class DoublyLinkedList<T> { // 양방향 연결 리스트
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public func append(value: T) {
        // 1. value를 갖는 새 노드 생성
        let newNode = Node(value: value)
        // 2-1. tailNode가 nil이 아님 = 링크드리스트에 무언가 있음. 따라서 기존의 tail 뒤에 새 노드를 추가.
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        // 2-2. 링크드리스트에 아무것도 없음. 새 노드가 head가 됨
        } else {
            head = newNode
        }
        // 3. 두 경우 모두 newNode를 tail로 지정하게 됨
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> Node<T>? {
        // 특정 인덱스의 노드를 반환
        if index >= 0 { // index가 음수일 때 무한루프 방지
            var node = head
            var i = index
            while node != nil { // 해당 인덱스의 노드에 도달할 때 까지 반복
                if i == 0 {
                    return node
                }
                i -= 1
                node = node!.next
            }
        }
        return nil // index가 음수이거나 연결리스트의 항목보다 클 때
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    // MARK: 비정상 동작
    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev { // prev가 있다면 첫 노드가 아닌 것이므로 prev의 next 수정
            prev.next = next
        } else { // prev가 없다면 head이므로 다음 노드를 head로 지정
            head = next
        }
        next?.previous = prev // next의 previous를 삭제되는 노드의 prev로 지정.
        if next == nil { // next가 없는 tail인 경우 tail을 수정
            tail = prev
        }
        
        
        node.previous = nil
        node.next = nil // 삭제하는 노드를 참조하는 previous와 next에 nil 할당 (메모리 해제)
        
        return node.value
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        return "\(value)"
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil {
                text += ", "
            }
        }
        return text + "]"
    }
}
