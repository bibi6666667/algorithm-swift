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
        // 이진 탐색 트리에서 삽입을 하려면 '내가 삽입하려는 위치까지 탐색을 해야 함'.
        // root부터 시작해 현재 노드가 내 데이터보다 크면 오른쪽, 작으면 왼쪽으로 이동
        guard let root = self.root else {
            self.root = Node.init(data: data)
            return
        } // 첫 데이터라면 루트로
        
        var currentNode = root
        while true {
            if currentNode.data > data { // 내 데이터보다 크면, 더 작은 왼쪽 노드로 이동
                guard let leftNode = currentNode.left else { // 왼쪽 노드가 비어있으면 그 위치에 저장
                    currentNode.left = Node.init(data: data)
                    return
                }
                currentNode = leftNode // 비어있지 않으면 그 왼쪽 노드와 다시 비교
            }
            if currentNode.data < data { // 내 데이터보다 작으면, 더 큰 오른쪽 노드로 이동
                guard let rightNode = currentNode.right else { // 오른쪽 노드가 비어있으면 그 위치에 저장
                    currentNode.right = Node.init(data: data)
                    return
                }
                currentNode = rightNode // 비어있지 않으면 그 오른쪽 노드와 다시 비교
            }
        }
    }
    
    func search(_ data: T) -> Bool {
        // 데이터 탐색 - 해당 데이터가 트리 내에 있으면 true, 없으면 false 반환
        // 삽입과 비슷 - 현재 노드의 데이터와 찾는 데이터를 비교하며 탐색
        if root == nil {
            return false
        }
        
        var currentNode = root
        while let node = currentNode { // nil이 아닐 때 반복 실행
            if node.data == data { // 현재 노드 데이터와 내 데이터가 같으면 존재하는 것이므로 true
                return true
            }
            if node.data > data { // 현재 노드 데이터보다 내 데이터가 작으면 왼쪽으로 이동
                currentNode = node.left
            }
            if node.data < data { // 현재 노드 데이터보다 내 데이터가 크면 오른쪽으로 이동
                currentNode = node.right
            }
        }
        return false
    }
    
    func remove(_ data: T) -> Bool {
        // 이진 트리의 삭제
        // 0. 삭제할 노드와 그 노드의 부모 노드를 모두 탐색해서 가지고 있어야 한다. (삭제 작업의 기본)
        
        guard let root = self.root else { return false }
        
        var parentNode = root
        var currentNode: Node? = root
        
        while let node = currentNode {
            if node.data == data {
                break
            }
            if node.data > data {
                currentNode = node.left
            }
            if node.data < data {
                currentNode = node.right
            }
            parentNode = node
        }
        
        guard let deleteNode = currentNode else { // 찾는 값이 트리에 없음
            return false
        }
        
        // 1. leaf node 삭제 (child node 없음) : 삭제할 node를 찾은 다음, 삭제할 node의 parent node에서 참조를 삭제한다(nil을 할당한다). - Node가 class로 구현되어 있으므로 참조횟수가 0이 되면 ARC가 자동으로 메모리에서 해제함
        if deleteNode.left == nil && deleteNode.right == nil { // leaf node인지 확인
            if parentNode.data > data { // 데이터보다 leaf node의 부모가 더 크다면, 데이터는 부모의 왼쪽 가지이므로 왼쪽의 참조 삭제 (nil 할당)
                parentNode.left = nil
            }
            if parentNode.data < data {
                parentNode.right = nil
            }
            return true
        }
        
        // 2. child node가 1개 있는 노드 삭제 : 삭제할 노드의 부모 노드가 삭제할 노드의 자식 노드를 가리키게 함
        if (deleteNode.left != nil) && (deleteNode.right == nil) { // 삭제할 노드의 왼쪽 자식노드만 존재
            if parentNode.data > data { // 삭제할 노드가 부모 노드보다 작음 = 부모 노드의 왼쪽에 존재
                parentNode.left = deleteNode.left // 부모 노드의 왼쪽 가지에 삭제할 노드의 왼쪽 가지를 이어줌
            }
            if parentNode.data < data { // 삭제할 노드가 부모 노드보다 큼 = 부모 노드의 오른쪽에 존재
                parentNode.right = deleteNode.left // 부모 노드의 오른쪽 가지에 삭제할 노드의 왼쪽 가지를 이어줌
            }
            return true
        }
        if (deleteNode.left == nil) && (deleteNode.right != nil) { // 삭제할 노드의 오른쪽 자식노드만 존재
            if parentNode.data > data {
                parentNode.left = deleteNode.right
            }
            if parentNode.data < data {
                parentNode.right = deleteNode.right
            }
        }
        
    }
    
    
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
