//
//  Softeer.swift
//  BaekJoon
//
//  Created by Bibi on 2023/01/16.
//

import Foundation

class Softeer {
    
    func q409(n: Int, graph: [[Int]]) { // 장애물 인식 프로그램
        var graph = graph
        var bumps: [Int] = []
        var bumpLength = 0
        
        func dfs(x: Int, y: Int) -> Bool {
            if x >= n || y >= n || x < 0 || y < 0 {
                return false
            }
            if graph[x][y] == 1 { // 세야 하는 대상
                graph[x][y] = 0
                bumpLength += 1
                
                dfs(x: x - 1, y: y)
                dfs(x: x + 1, y: y)
                dfs(x: x, y: y - 1)
                dfs(x: x, y: y + 1)
                return true
            }
            return false
        }
        
        for x in (0..<n) {
            for y in (0..<n) {
                if dfs(x: x, y: y) == true {
                    bumps.append(bumpLength)
                    bumpLength = 0
                }
            }
        }
        
        print(bumps.count)
        bumps.sorted().forEach{ print($0) }
    }
}
