//
//  q83.swift
//  LeetCode
//
//  Created by Bibi on 2022/01/12.
//

import Foundation



/// 출처 : https://hyerios.tistory.com/250
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var node = head // 첫 노드로 헤드만 가져옴
    
    while node?.next != nil { // 다음 값이 없을 때까지 끝까지 반복
        while node?.val == node?.next?.val { // 현재 값과 뒷 값이 같지 않을 때까지 반복
            node?.next = node?.next?.next
        }
        node = node?.next // 노드를 다음 노드로 치환
    }
    return head
    // return node가 아닌 이유 : node는 하나의 노드일 뿐 연결리스트 전체가 아님. 전체 연결리스트의 시작이자 작업이 반영된 head를 반환해야.
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

/// 내가 시도한 코드.. (구현 실패ㅠ)
//var valueList = Array<Int>()
//
//// 중복 제거하고 정렬하여 반환하기
//func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//
//    if let headNode = head {
//        // head에 값이 있음
//        saveNodeValueToValueList(node: headNode)
//        var node = headNode
//        while (checkNextNodeExist(currentNode: node)) {
//            saveNodeValueToValueList(node: node)
//            node = node.next!
//        }
//    } else {
//        // head가 nil임
//        return nil
//    }
//
//    return makeListNodeFromValueList()
//}
//
//func makeListNodeFromValueList() -> ListNode {
//    var result = ListNode()
//    var pointer: ListNode? = nil
//    var previousNode = ListNode()
//    if valueList.isEmpty {
//        return result
//    } else {
//        valueList.sort()
//        for i in 1...valueList.count { // 맨 끝 노드 만들고, 그 앞 노드 만들어 만든 노드 가리키기
//            var lastNode = ListNode()
//            lastNode.val = valueList[valueList.count - i]
//            previousNode.next = lastNode
//            result = previousNode
//            print("result : \(result)")
//        }
//    }
//    return result
//}
//
//func checkNextNodeExist(currentNode: ListNode) -> Bool {
//    if currentNode.next != nil {
//        return true
//    }
//    return false
//}
//
//func saveNodeValueToValueList(node: ListNode) {
//    if !valueList.contains(node.val) { // 중복제거
//        valueList.append(node.val)
//    }
//}
