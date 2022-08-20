//
//  Chobo.swift
//  BaekJoon
//
//  Created by Bibi on 2022/08/11.
//

import Foundation

class Chobo {
    func q1152() {
        let inputArr = readLine()!.split(separator: " ")
        print(inputArr.count)
    }
    
    func q1259() { // 팰린드롬수
    whileLoop: while true { // 루프 이름 붙이기
            let input = readLine()!
            let inputArr = input.map { String($0) } // 문자열 -> 문자 배열 input.map { $0 }
            let inputArr2 = Array(input)
            let inputArrItem = inputArr[0]
            let inputArr2Item = inputArr2[0]
            if input == "0" {
                break
            }
            //123456 : 0~2 인덱스부터 3~5 인덱스까지 비교 = 05, 14, 23
            // 12345 : 0~1 인덱스부터 3~4 인덱스까지 비교 = 04, 13
            if inputArr.count % 2 == 0 { // 짝수
                let indexHalf = inputArr.count / 2
                for index in 0..<indexHalf {
                    if inputArr[index] != inputArr[inputArr.count - 1 - index] {
                        print("no")
                        continue whileLoop
                    }
                }
            }
            
            if inputArr.count % 2 == 1 { // 홀수
                let indexHalf = (inputArr.count - 1) / 2
                for index in 0..<indexHalf {
                    if inputArr[index] != inputArr[inputArr.count - 1 - index] {
                        print("no")
                        continue whileLoop
                    }
                }
            }
            print("yes")
        }
    }
}
