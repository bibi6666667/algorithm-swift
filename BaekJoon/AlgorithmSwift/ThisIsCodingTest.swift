//
//  ThisIsCodingTest.swift
//  BaekJoon
//
//  Created by Bibi on 2022/12/12.
//

import Foundation

class ThisIsCodingTest { // 이것이 코딩 테스트다
    func greedy3(nm : String, array: [String]) { // 숫자 카드 게임
        var maxNum = 0
        for line in array {
            let cards = line.split(separator: " ").map{ Int($0)! }
            if maxNum < cards.min()! {
                maxNum = cards.min()!
            }
        }
        print(maxNum)
    }
    
    func implementation2(position: String) -> Int { // a1
        let positionX = Int(position.first!.asciiValue! - 96) // 아스키코드 사용
        let positionY = Int(String(position.last!))!
        print(positionX, positionY)
        
        var answer = 0
        let moves: [(x: Int, y: Int)] = [(2, 1), (2, -1), (-2, 1), (-2, -1), (1, 2), (-1, 2), (1, -2), (-1, -2)]
        for move in moves {
            let movedX = move.x + positionX
            let movedY = move.y + positionY
            if (1...8).contains(movedX) && (1...8).contains(movedY) {
                answer += 1
            }
        }
        return answer
    }
    
    func dfs1(n: Int, m : Int, graph: [[Int]]) -> Int {
        // 특정 노드를 방분하고, 이후 상하좌우에 연결된 모든 노드들도 방문한다.
        var graph = graph
        var answer = 0
        var iceLength = 0
        
        func dfs(x: Int, y: Int) -> Bool {
            // 주어진 범위 초과시 즉시 종료
            if x < 0 || y < 0 || x >= n || y >= m {
                return false
            }
            // 현재 노드를 아직 방문하지 않았다면
            if graph[x][y] == 0 {
                // 해당 노드 방문 처리
                graph[x][y] = 1
                iceLength += 1
                // 상하좌우 노드에도 방문 (재귀호출)
                dfs(x: x - 1, y: y)
                dfs(x: x + 1, y: y)
                dfs(x: x, y: y - 1)
                dfs(x: x, y: y + 1)
                
                return true
            }
            return false
        }
        
        for x in (0..<n) {
            for y in (0..<m) {
                if dfs(x: x, y: y) == true {
                    print(iceLength)
                    iceLength = 0
                    answer += 1
                }
            }
        }
        
        return answer
    }
}
