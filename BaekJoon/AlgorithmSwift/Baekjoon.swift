//
//  Baekjoon.swift
//  BaekJoon
//
//  Created by Bibi on 2023/01/16.
//

import Foundation

class BaekJoon {
    
    func q2178() {
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        let n = inputArr[0]
        let m = inputArr[1]
        
        var maze = [[Int]]()
        
        for _ in (0..<n) {
            let innerArr = readLine()!.map { Int(String($0))! }
            maze.append(innerArr)
        }
        
        var queue = [(0,0)] // 시작점
        
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            
            for i in (0..<4) {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || ny < 0 || nx >= n || ny >= m {
                    continue
                }
                if maze[nx][ny] == 0 {
                    continue
                }
                if maze[nx][ny] == 1 {
                    maze[nx][ny] = maze[x][y] + 1
                    queue.append((nx, ny))
                }
            }
        }
        print(maze)
        print(maze[n-1][m-1])
    }
}
