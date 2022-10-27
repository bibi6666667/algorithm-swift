//
//  Recursion.swift
//  BaekJoon
//
//  Created by Bibi on 2022/10/18.
//

import Foundation

class Recursion {
    func sum(_ arr: [Int]) -> Int {
        var arr = arr
        if arr.isEmpty { // 기본 단계
            return 0
        }
        return arr.removeFirst() + sum(arr)
    }
    
    func count(_ arr: [Int]) -> Int {
        var arr = arr
        if arr.isEmpty { // 기본 단계
            return 0
        }
        arr.popLast()
        return 1 + count(arr)
    }
    
    func max(_ arr: [Int]) -> Int { // ?? 풀이 봤는데도 안됨.. 첫 원소 누락
        var arr = arr
        if arr.count == 2 {
            return arr[0] > arr[1] ? arr[0] : arr[1]
        }
        arr = Array<Int>(arr[1..<arr.count])
        print(arr)
        let subMax = max(arr)
        return arr[0] > subMax ? arr[0] : subMax
    }
}
