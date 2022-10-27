//
//  Programmers.swift
//  BaekJoon
//
//  Created by Bibi on 2022/09/24.
//

import Foundation

class Programmers {
    // 합30,(15) 14, 16
    // 합20,(10) 6, 14
    // 합8,(4) 2, 6
    func solution(_ queue1:[Int], _ queue2:[Int]) -> Int { // 두 큐 합 같게 만들기
        let sum = (queue1.reduce(0, +) + queue2.reduce(0, +))
        let sumHalf = sum / 2
        // insert : 뒤에 넣기, pop : 앞에서 빼기
        var tempQueue1 = queue1
        var tempQueue2 = queue2
        var operation = 0
        if sum % 2 == 1 {
            return -1
        }
        if tempQueue1.max()! > sumHalf || tempQueue2.max()! > sumHalf {
            return -1
        }
        var tempQueue1Sum = tempQueue1.reduce(0, +)
        var tempQueue2Sum = tempQueue2.reduce(0, +)
        while true {
            
            if tempQueue1Sum == sumHalf || tempQueue2Sum == sumHalf {
                break
            }
            
            if tempQueue1Sum > tempQueue2Sum {
                let popItem = tempQueue1.removeFirst() // pop
                tempQueue2.append(popItem) // insert
                tempQueue1Sum -= popItem
                tempQueue2Sum += popItem
                operation += 1
            }
            if tempQueue1Sum < tempQueue2Sum {
                let popItem = tempQueue2.removeFirst()
                tempQueue1.append(popItem)
                tempQueue2Sum -= popItem
                tempQueue1Sum += popItem
                operation += 1
            }
            print(tempQueue1, tempQueue2)
        }
        return operation
    }
    
    
}
