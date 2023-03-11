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
    
    func q12931(_ n: Int) -> Int { // 자릿수 더하기
        var answer = 0
        for char in String(n) {
            let digit = Int(String(char))!
            answer += digit
        }
        return answer
    }
    
    func q12916(_ s: String) -> Bool { // 문자열 내 p와 y의 개수
        var answer = false
        var pCount = 0
        var yCount = 0
        for char in s.uppercased() {
            if char == "P" {
                pCount += 1
            }
            if char == "Y" {
                yCount += 1
            }
        }
        if pCount == yCount {
            answer = true
        } else {
            answer = false
        }
        return answer
    }
    
    func q12954(_ x: Int, _ n: Int) -> [Int] { // x만큼 간격이 있는 n개의 숫자
        var answer: [Int] = []
        for i in (1...n) {
            answer.append(x * i)
        }
        return answer
    }
    
    func q12934(_ n:Int64) -> Int64 { // 정수 제곱근 판별
        //        var answer: Int64 = 0
        //        let root = sqrt(Double(n))
        //        let rootInt = Double(Int(root))
        //        if root != rootInt {
        //            answer = -1
        //        } else {
        //            answer = Int64(pow(rootInt + 1, 2))
        //        }
        //        return answer
        var answer: Int64 = 0
        let rootInt = Int64(sqrt(Double(n)))
        if rootInt * rootInt == n {
            answer = (rootInt + 1) * (rootInt + 1)
        } else {
            answer = -1
        }
        return answer
    }
    
    func test(n: Double) {
        let nPow = Int(n * n)
        let intNPow = Int(n) * Int(n)
        if nPow == intNPow {
            print("\(n)은 소수점 이하 값이 없는 Double")
        } else {
            print("\(n)은 소수점 이하 값이 있는 Double")
        }
    }
}
