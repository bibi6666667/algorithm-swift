//
//  Stack.swift
//  BaekJoon
//
//  Created by Bibi on 2022/07/18.
//

import Foundation


struct Stack<Element> {
    fileprivate var array: [Element] = []

    var isEmpty: Bool {
        return array.isEmpty
    }

    var count: Int {
        return array.count
    }

    mutating func push(_ element: Element) {
        array.append(element)
    }

    mutating func pop() -> Element? {
        return array.popLast()
    }

    func peek() -> Element? {
        return array.last
    }
}
