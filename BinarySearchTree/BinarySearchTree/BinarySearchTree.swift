//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by Bibi on 2022/08/19.
//

import Foundation

class BinarySearchTree<T: Comparable> {
    var root: Node<T>? // 최상위 노드
    
    func insert(_ data: T) {
        // 첫 데이터라면 루트로 설정
        guard let root = self.root else {
            self.root = Node(data: data)
            return
        }
        
        var currentNode: Node = root
        while true {
            
            // 이진탐색트리의 값은 유일해야 함
            if currentNode.data == data {
                return
            }
            
            if currentNode.data > data {
                // 내 데이터보다 크면, 더 작은 왼쪽 노드로 이동
                guard let leftNode = currentNode.left else {
                    // 왼쪽 노드가 비어있으면 그 위치에 저장
                    currentNode.left = Node.init(data: data)
                    currentNode.left?.parent = currentNode
                    return
                }
                currentNode = leftNode // 비어있지 않으면 그 왼쪽 노드와 다시 비교
            }
            
            if currentNode.data < data {
                // 내 데이터보다 작으면, 더 큰 오른쪽 노드로 이동
                guard let rightNode = currentNode.right else { // 오른쪽 노드가 비어있으면 그 위치에 저장
                    currentNode.right = Node.init(data: data)
                    currentNode.right?.parent = currentNode
                    return
                }
                currentNode = rightNode // 비어있지 않으면 그 오른쪽 노드와 다시 비교
            }
        }
    }
    
    func search(_ data: T) -> Node<T>? {
        var currentNode: Node? = root
        while let node = currentNode { // nil이 아닐 때 반복 실행
            if node.data == data { // 현재 노드 데이터와 내 데이터가 같으면 존재하는 것이므로 true
                return currentNode
            }
            if node.data > data { // 현재 노드 데이터보다 내 데이터가 작으면 왼쪽으로 이동
                currentNode = node.left
            }
            if node.data < data { // 현재 노드 데이터보다 내 데이터가 크면 오른쪽으로 이동
                currentNode = node.right
            }
        }
        return currentNode
    }
    
    func remove(_ data: T) -> Bool {
        // 삭제할 노드와 그 노드의 부모 노드를 모두 탐색해서 가지고 있어야 한다. (삭제 작업의 기본)
        guard let targetNode = search(data) else { return false } // 삭제할 데이터가 존재하지 않는 경우
        guard let root = self.root else { return false } // 루트가 비어있는 경우
        
        if targetNode.isRoot { // 루트 노드를 지우는 경우
            removeRoot(targetNode)
            return true
        }
        if targetNode.isLeaf { // 리프 노드를 지우는 경우
            removeLeaf(targetNode, data: data)
        }
        if targetNode.isFull {
            removeFromFullNode(targetNode, data: data)
        } else { // 자식 노드가 1개인 경우
            removeFromSingleChildNode(targetNode, data: data)
        }
        
        return true
    }
    
    // 루트 노드 삭제
    private func removeRoot(_ node: Node<T>) {
        if node.isLeaf { // 루트 노드인데 자식 노드도 전혀 없는 경우
            root = nil
            return
        }
        if node.isFull { // 루트의 자식 노드가 둘 다 있는 경우
            // 오른쪽 서브 트리 중 가장 작은 노드를 루트로 만든다.
            var newRootNode = node.right!
            while let nextNode = newRootNode.left {
                newRootNode = nextNode
            }
            
            newRootNode.left = root?.left
            newRootNode.right = root?.right
            root = newRootNode
            
            newRootNode.parent?.left = nil
            // MARK: 107번 줄 넣어야 하는 거 아닌가??
            //            newRootNode.parent = nil
            return
        }
        if node.left != nil && node.right == nil { // 왼쪽 자식 노드만 있는 경우
            node.left?.parent = nil
            root = node.left
            return
        }
        if node.left == nil && node.right != nil { // 오른쪽 자식 노드만 있는 경우
            node.right?.parent = nil
            root = node.right
            return
        }
    }
    
    // 리프 노드 삭제
    private func removeLeaf(_ node: Node<T>, data: T) {
        if node.parent?.left?.data == data { // 리프 노드가 부모의 왼쪽 노드일 경우
            node.parent?.left = nil
        }
        if node.parent?.right?.data == data { // 리프 노드가 부모의 오른쪽 노드일 경우
            node.parent?.right = nil
        }
        node.parent = nil // 양방향 참조 제거
    }
    
    // 자식 노드가 1개인 노드 삭제
    private func removeFromSingleChildNode(_ node: Node<T>, data: T) {
        guard let parent = node.parent else { return } // 삭제할 노드의 부모가 있는지 확인
        
        if node.left != nil { // 삭제할 노드의 왼쪽 노드가 존재하는 경우
            if parent.data > data { // 삭제할 데이터가 부모의 왼쪽
                parent.left = node.left // 삭제할 노드의 왼쪽을 부모 노드 왼쪽으로 연결
            }
            if parent.data < data {
                parent.right = node.left
            }
            node.left?.parent = parent // 양방향
        }
        if node.right != nil { // 삭제할 노드의 오른쪽 노드가 존재하는 경우
            if parent.data > data { // 삭제할 데이터가 부모의 왼쪽
                parent.left = node.right // 삭제할 노드의 오른쪽을 부모 노드 왼쪽에 연결
            }
            if parent.data < data { // 삭제할 데이터가 부모의 오른쪽
                parent.right = node.right
            }
            node.right?.parent = parent
        }
    }
    
    // 자식 노드가 2개인 노드 삭제
    private func removeFromFullNode(_ node: Node<T>, data: T) {
        // 오른쪽 노드의 최소 노드를 삭제할 노드의 위치로 교체한다
        guard let parent = node.parent,
              let rightNode = node.right else { return }
        
        var changeNode = rightNode
        while let nextNode = changeNode.left { // 오른쪽 노드의 최소 노드 찾기
            changeNode.parent = changeNode
            changeNode = nextNode
        }
        
        if let changeNodeRightChild = changeNode.right { // 최소 노드에 오른쪽 자식 노드가 존재하는 경우
            changeNode.parent?.left = changeNodeRightChild
            changeNodeRightChild.parent = changeNode.parent
        }
        if changeNode.isLeaf { // 최소 노드가 리프 노드인 경우
            changeNode.parent?.left = nil
        }
        
        if parent.data > changeNode.data { // 바꿀 노드가 삭제할 노드의 부모 노드의 왼쪽에 존재하면
            parent.left = changeNode // 부모 노드의 왼쪽 노드로 교체
        }
        if parent.data < changeNode.data {
            parent.right = changeNode
        }
        changeNode.parent = parent
        
        // 삭제한 노드의 왼쪽, 오른쪽 가지를 바꾼 노드의 왼쪽, 오른쪽으로 연결
        changeNode.left = node.left
        changeNode.right = node.right
    }
    
    // 순회하기 - 재귀
    func traversePreorder(node: Node<T>?) { // 전위, NLR
        guard let node = node else {
            return
        }
        
        print(node.data, terminator: " ") // 루트 노드
        self.traversePreorder(node: node.left)
        self.traversePreorder(node: node.right)
    }
    
    func traverseInorder(node: Node<T>?) { // 중위, LNR
        guard let node = node else {
            return
        }
        
        self.traverseInorder(node: node.left)
        print(node.data, terminator: " ")
        self.traverseInorder(node: node.right)
    }
    
    func traversePostorder(node: Node<T>?) { // 후위, LRN
        guard let node = node else {
            return
        }
        
        self.traversePostorder(node: node.left)
        self.traversePostorder(node: node.right)
        print(node.data, terminator: " ")
    }
}

extension BinarySearchTree {
    func drawDiagram() {
        print(diagram(for: self.root))
    }
    
    private func diagram(for node: Node<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
        + root + "\(node.data)\n"
        + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}
