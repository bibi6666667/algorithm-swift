//
//  main.swift
//  BinarySearchTree
//
//  Created by Bibi on 2022/08/19.
//

import Foundation

let bst = BinarySearchTree<Int>()
bst.insert(15)
bst.insert(10)
bst.insert(9)
bst.insert(13)
//bst.insert(8)
bst.insert(20)
bst.insert(18)
bst.insert(21)
bst.drawDiagram()

//bst.traversePreorder(node: bst.root)
//bst.traverseInorder(node: bst.root)
bst.traversePostorder(node: bst.root)
//bst.insert(15)
//bst.insert(16)
//bst.insert(9)
//bst.insert(8)
//bst.drawDiagram()

//bst.remove(10)
//bst.drawDiagram()
