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
    
    func q1264() { // 모음의 개수
        let vowel: [Character] = ["a", "e", "i", "o", "u"]
        while true {
            let inputStr = readLine()!.lowercased()
            if inputStr == "#" {
                break
            }
            
            var vowelCount = 0
            for char in inputStr {
                if vowel.contains(char) {
                    vowelCount += 1
                }
            }
            // 위 반복문을 아래 한줄로 바꿀 수 있다. - filter 활용
            // print(input.filter { vowel.contains(String($0)) }.count)
            print(vowelCount)
        }
    }
    
    func q1371() { // 가장 많은 글자
        // 존재하지 않는 알파벳은 셀 필요가 없다 - a부터 z까지 갖고 있을 필요가 없음
        var inputArr: [String] = []
        while let input = readLine() { // input이 없을때까지 받기
            let newInput = input.filter { $0 != " "} // 공백은 빼줘야함!!
            // arr += inputArr : arr에 inputArr의 요소만 넣어준다 - append(inputArr)와는 다름!
            inputArr.append(newInput)
        }
        var alphabetDic: [Character : Int] = [:]
        inputArr.forEach { input in
            input.forEach { char in
                alphabetDic[char, default: 0] += 1
            }
        }
        
        let maxValue = alphabetDic.values.max()
        let resultArr = alphabetDic.filter { element in
            element.value == maxValue
        }.keys
        print(String(resultArr.sorted()))
    }
    
    func q2420() { // 사파리월드
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        
        print(abs(inputArr[0] - inputArr[1]))
    }
    
    func q1547() { // 공
        let inputCount = Int(readLine()!)!
        var ballPosition = 1
        for _ in 1...inputCount {
            let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
            if inputArr.contains(ballPosition) {
                let movedPosition = inputArr.filter {
                    $0 != ballPosition
                }[0]
                ballPosition = movedPosition
            }
        }
        print(ballPosition)
    }
    
    func q1568() { // 새
        let bird = Int(readLine()!)!
        var birdLeft = bird
        var birdFly = 1
        var time = 0
        while birdLeft > 0 {
            if birdLeft < birdFly {
                birdFly = 1
            }
            birdLeft -= birdFly
            birdFly += 1
            time += 1
        }
        print(time)
    }
    
    func q1731() { // 추론
        let inputCount = Int(readLine()!)!
        var inputArr: [Int] = []
        for _ in 1...inputCount {
            let input = Int(readLine()!)!
            inputArr.append(input)
        }
        let plus = inputArr[1] - inputArr[0]
        if plus == (inputArr[2] - inputArr[1]) {
            print(inputArr[inputCount - 1] + plus)
            return
        }
        let multiple = inputArr[1] / inputArr[0]
        if multiple == (inputArr[2] / inputArr[1]) {
            print(inputArr[inputCount - 1] * multiple)
            return
        }
    }
    
    func q1834() { // 나머지와 몫이 같은 수
        let n = Int(readLine()!)!
        var 몫과나머지 = 0
        var answer = 0
        while true {
            몫과나머지 += 1
            if 몫과나머지 == n {
                break
            }
            let number = n * 몫과나머지 + 몫과나머지
            answer += number
            
        }
        print(answer)
    }
    
    func q1864() { // 문어 숫자
        while true {
            let input = readLine()!
            if input == "#" {
                break
            }
            
            var octoNum = 0
            var maxPow = input.count - 1
            for index in input.indices {
                let char = input[index]
                let octa = pow(8.0, Float(maxPow))
                switch char {
                case "-":
                    octoNum += 0 * Int(octa)
                case "\\":
                    octoNum += 1 * Int(octa)
                case "(":
                    octoNum += 2 * Int(octa)
                case "@":
                    octoNum += 3 * Int(octa)
                case "?":
                    octoNum += 4 * Int(octa)
                case ">":
                    octoNum += 5 * Int(octa)
                case "&":
                    octoNum += 6 * Int(octa)
                case "%":
                    octoNum += 7 * Int(octa)
                case "/":
                    octoNum += -1 * Int(octa)
                default:
                    break
                }
                maxPow -= 1
            }
            print(octoNum)
        }
    }
    
    func q2309() { // 일곱 난쟁이
        // 7개의 합을 구하는 게 아니라 전체합 - 100 해서 나머지 2개의 합을 구하기
        // 반복문 / 조합 으로 구하기 - set공부
        var inputArr: [Int] = []
        for _ in 1...9 {
            let input = Int(readLine()!)!
            inputArr.append(input)
        }
        inputArr.sort()
        let exceptSum = inputArr.reduce(0, +) - 100
        outerLoop : for index1 in inputArr.indices {
            let except1 = inputArr[index1]
            for index2 in inputArr.indices {
                let except2 = inputArr[index2]
                if (except1 + except2 == exceptSum) {
                    inputArr.remove(at: max(index1, index2))
                    inputArr.remove(at: min(index1, index2))
                    break outerLoop
                }
            }
        }
        for input in inputArr {
            print(input)
        }
    }
    
    func q2355() { // 시그마
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        let a = inputArr.min()!
        let b = inputArr.max()!
        print((b * (b + 1)) / 2 - (a * (a - 1)) / 2)
    }
    
    func q2386() { // 도비의 영어 공부
        while true {
            let input = readLine()!.lowercased()
            if input == "#" {
                break
            }
            
            let inputArr = input.split(separator: " ")
            let alphabet = inputArr[0]
            var alphabetCount = 0
            for inputChar in input {
                print(inputChar)
                if String(inputChar) == alphabet {
                    alphabetCount += 1
                }
            }
            print("\(alphabet) \(alphabetCount - 1)")
        }
    }
    
    func q2475() { // 검증수
        let inputArr = readLine()!.split(separator: " ").map { Float($0)! }
        let sum = inputArr.reduce(0) { partialResult, num in
            partialResult + pow(num, 2)
        }
        print(Int(sum) % 10)
    }
    
    func q2476() { // 주사위 게임
        let count = Int(readLine()!)!
        var answer = 0
        (1...count).forEach { _ in
            let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
            let a = inputArr[0]
            let b = inputArr[1]
            let c = inputArr[2]
            var prize = 0
            if a == b && b == c && a == c {
                prize = 10000 + (a * 1000)
            } else if a == b || b == c || a == c {
                var equalNum = 0
                if inputArr.filter({ $0 == a }).count == 2 {
                    equalNum = a
                } else {
                    equalNum = c
                }
                prize = 1000 + equalNum * 100
            } else {
                prize = inputArr.max()! * 100
            }
            if prize > answer {
                answer = prize
            }
        }
        print(answer)
    }
    
    func q2484() { // 주사위 네개
        let count = Int(readLine()!)!
        var answer = 0
        (1...count).forEach { _ in
            let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
            var prize = 0
            var equalCount = 0
            var equalNum = 0
            for index in 0..<4 {
                let count = inputArr.filter { $0 == inputArr[index] }.count
                if count > equalCount {
                    equalCount = count
                    equalNum = inputArr[index]
                }
            }
            switch equalCount {
            case 4:
                prize = 50000 + equalNum * 5000
            case 3:
                prize = 10000 + equalNum * 1000
            case 2:
                let partialArr = inputArr.filter { $0 != equalNum }
                if partialArr[0] == partialArr[1] {
                    let anotherEqualNum = partialArr[0]
                    prize = 2000 + equalNum * 500 + anotherEqualNum * 500
                } else {
                    prize = 1000 + equalNum * 100
                }
            case 1:
                prize = inputArr.max()! * 100
            default:
                return
            }
            
            if prize > answer {
                answer = prize
            }
        }
        print(answer)
    }
}
