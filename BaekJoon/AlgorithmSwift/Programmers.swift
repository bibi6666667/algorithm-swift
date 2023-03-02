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
    
    func solution(_ n: Int) -> Int { // 다음 큰 숫자
        var answer: Int = n
        var answerCount1 = countBinary1(num: answer)
        while true {
            answer += 1
            let binaryCount1 = countBinary1(num: answer)
            print(answer, binaryCount1)
            if binaryCount1 == answerCount1 {
                break
            }
        }
        return answer
    }
    
    func countBinary1(num: Int) -> Int {
        var count1 = 0
        let answerBinary = String(num, radix: 2)
        answerBinary.forEach { char in
            if char == "1" {
                count1 += 1
            }
        }
        return count1
    }
    
    func q12937(_ num: Int) -> String { // 짝수와 홀수
        var answer = ""
        if num % 2 == 0 {
            answer = "Even"
        } else {
            answer = "Odd"
        }
        return answer
    }
    
    func q12944(_ arr: [Int]) -> Double { // 평균 구하기
        return Double(arr.reduce(0, +)) / Double(arr.count)
    }
}
