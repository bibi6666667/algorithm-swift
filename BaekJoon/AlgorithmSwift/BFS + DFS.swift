//
//  BFS.swift
//  BaekJoon
//
//  Created by Bibi on 2022/12/22.
//

import Foundation

class Node<T>: CustomStringConvertible {
    
    var value: T
    var next: Node<T>?
    
    var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> " + String(describing: next)
    }
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}


struct Queue<T>: CustomStringConvertible {
    
    var front: Node<T>?
    
    var rear: Node<T>?
    
    init() { }
    
    var isEmpty: Bool {
        return front == nil
    }
    
    var description: String {
        guard let front = front else { return "Empty Queue" }
        return String(describing: front)
    }
    
    var peek: T? {
        return front?.value
    }
}

extension Queue {
    
    mutating private func push(_ value: T) {
        front = Node(value: value, next: front)
        if rear == nil {
            rear = front
        }
    }
    
    mutating func enqueue(_ value: T) {
        if isEmpty {
            self.push(value)
            return
        }
        
        rear?.next = Node(value: value)
        rear = rear?.next
    }
    
    mutating func dequeue() -> T? {
        defer {
            front = front?.next
            if isEmpty {
                rear = nil
            }
        }
        return front?.value
    }
}


let graph = [
    [],
    [2, 3, 8],
    [1, 7],
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
]



func bfs(graph: [[Int]], start: Int) {
    var queue = Queue<Int>()
    var visited = Array(repeating: false, count: graph.count + 1)
    
    queue.enqueue(start)
    visited[start] = true
    
    while !queue.isEmpty {
        guard let key = queue.dequeue() else { return }
        
        print(key, terminator: " ")
        for i in graph[key] {
            if !visited[i] {
                queue.enqueue(i)
                visited[i] = true
            }
        }
    }
}

var visited = Array(repeating: false, count: graph.count)

func dfs(graph: [[Int]], start: Int) {
    visited[start] = true // 시작점
    
    print(start, terminator: " ")
    
    for i in graph[start] { // 왼쪽부터 순회
        if !visited[i] {
            dfs(graph: graph, start: i)
        }
    }
}

///
let graph2: [Int : [Int]] = [
    1 : [2, 3, 8],
    2 : [1, 7],
    3 : [1, 4, 5],
    4 : [3, 5],
    5 : [3, 4],
    6 : [7],
    7 : [2, 6, 8],
    8 : [1, 7]
]

func bfs2(graph: [Int : [Int]], start: Int) {
    var queue = Queue<Int>() // BFS는 Queue를 사용
    var visited = Array<Bool>(repeating: false, count: graph.count + 1)
    
    queue.enqueue(start)
    visited[start] = true
    
    while queue.isEmpty == false {
        if let key = queue.dequeue(),
           let values = graph[key] {
            print(key, terminator: " ")
            for i in values {
                if visited[i] == false {
                    queue.enqueue(i)
                    visited[i] = true
                }
            }
        }
    }
}


//let graph: [Int : [Int]] = [
//    1 : [2, 3, 8],
//    2 : [1, 7],
//    3 : [1, 4, 5],
//    4 : [3, 5],
//    5 : [3, 4],
//    6 : [7],
//    7 : [2, 6, 8],
//    8 : [1, 7]
//]
