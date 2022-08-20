//
//  Node.swift
//  BinarySearchTree
//
//  Created by Bibi on 2022/08/19.
//

import Foundation

class Node<T: Comparable> { // 비교 가능한 데이터만 저장 - 탐색 시 비교해야 하므로
    var data: T // 데이터는 항상 존재해야 함
    var left: Node? // 왼쪽, 오른쪽 노드는 있을 수도 있고 없을 수도 있으므로 옵셔널
    var right: Node?
    
    init(data: T) {
        self.data = data
    }
}
