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
    
    func q2490() { // 윷놀이
        (1...3).forEach { _ in
            let input = readLine()!.split(separator: " ")
            let upperCount = input.filter { $0 == "0" }.count
            switch upperCount {
            case 1:
                print("A")
            case 2:
                print("B")
            case 3:
                print("C")
            case 4:
                print("D")
            case 0:
                print("E")
            default:
                break
                
            }
        }
    }
    
    func q2562() { // 최댓값
        var maxNum = 0
        var maxIndex = 0
        (1...9).forEach { index in
            let input = Int(readLine()!)!
            if input > maxNum {
                maxNum = input
                maxIndex = index
            }
        }
        print(maxNum, maxIndex, separator: "\n")
    }
    
    func q2566() { // 최댓값
        var maxNum = 0
        var maxIndex: (x: Int, y: Int) = (0, 0)
        (0..<9).forEach { index in
            let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
            let currentMax = inputArr.max()!
            if currentMax > maxNum {
                maxNum = currentMax
                maxIndex.x = index
                maxIndex.y = inputArr.firstIndex(of: currentMax)!
            }
        }
        print(maxNum)
        print(maxIndex.x + 1, maxIndex.y + 1)
        //        var maxNum = 0
        //        var maxIndex: (x: Int, y: Int) = (0, 0)
        //        (0..<9).forEach { indexX in
        //            let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        //            (0..<9).forEach { indexY in
        //                let input = inputArr[indexY]
        //                if input > maxNum {
        //                    maxNum = input
        //                    maxIndex.x = indexX
        //                    maxIndex.y = indexY
        //                }
        //            }
        //        }
        //        print(maxNum)
        //        print(maxIndex.x + 1, maxIndex.y + 1)
    }
    
    func q25024() { // 시간과 날짜
        let inputCount = Int(readLine()!)!
        (1...inputCount).forEach { _ in
            let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
            var isTime = false
            var isDate = false
            if (0...23).contains(inputArr[0])
                && (0...59).contains(inputArr[1]) {
                isTime = true
            }
            if (1...12).contains(inputArr[0]) {
                switch inputArr[0] {
                case 1, 3, 5, 7, 8, 10, 12:
                    if (1...31).contains(inputArr[1]) {
                        isDate = true
                    }
                case 4, 6, 9, 11:
                    if (1...30).contains(inputArr[1]) {
                        isDate = true
                    }
                case 2:
                    if (1...29).contains(inputArr[1]) {
                        isDate = true
                    }
                default:
                    break
                }
            }
            print("\(isTime ? "Yes" : "No") \(isDate ? "Yes" : "No")")
        }
    }
    
    func q2576() { // 홀수
        var oddArr: [Int] = []
        (1...7).forEach { _ in
            let input = Int(readLine()!)!
            if input % 2 == 1 {
                oddArr.append(input)
            }
        }
        if oddArr.isEmpty {
            print(-1)
        } else {
            print(oddArr.reduce(0, +))
            print(oddArr.min()!)
        }
    }
    
    func q2739() { // 구구단
        let dan = Int(readLine()!)!
        (1...9).forEach { num in
            print("\(dan) * \(num) = \(dan * num)")
        }
    }
    
    func q25191() { // 치킨댄스를 추는 곰곰이를 본 임스
        let chicken = Int(readLine()!)!
        let drinks = readLine()!.split(separator: " ").map { Int($0)! }
        let maxEat = drinks[0] / 2 + drinks[1]
        chicken > maxEat ? print(maxEat) : print(chicken)
    }
    
    func q24265() { // 알고리즘의 수행시간 4
        let input = Int(readLine()!)!
        print(input * (input - 1) / 2, 2)
    }
    
    func q24267() { // 알고리즘의 수행시간 6
        let input = Int(readLine()!)!
        print(input * (input - 1) * (input - 2) / 6, 3)
    }
    
    func q2744() { // 대소문자 바꾸기
        let input = readLine()!
        var answer = ""
        for char in input {
            if char.isUppercase {
                answer += char.lowercased()
            } else {
                answer += char.uppercased()
            }
        }
        print(answer)
    }
    
    func q2754() { // 학점계산
        let input = readLine()!
        var answer = ""
        switch input {
        case "A+":
            answer = "4.3"
        case "A0":
            answer = "4.0"
        case "A-":
            answer = "3.7"
        case "B+":
            answer = "3.3"
        case "B0":
            answer = "3.0"
        case "B-":
            answer = "2.7"
        case "C+":
            answer = "2.3"
        case "C0":
            answer = "2.0"
        case "C-":
            answer = "1.7"
        case "D+":
            answer = "1.3"
        case "D0":
            answer = "1.0"
        case "D-":
            answer = "0.7"
        case "F":
            answer = "0.0"
        default:
            return
        }
        print(answer)
    }
    
    func q2789() { // 유학 금지
        let censor = "CAMBRIDGE"
        let input = readLine()!
        let answer = input.filter {
            return !censor.contains($0)
        }
        print(answer)
    }
    
    func q2798() { // 블랙잭
        // 그리디? 아님ㅠㅠ 브루트포스. 조합 복습!
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let totalMax = input[1]
        let count = input[0]
        var cards = readLine()!.split(separator: " ").map { Int($0)! }
        var currentMax = 0
        for i in 0..<count {
            for j in i + 1..<count { // 직전 반복문에서 사용한 다음 요소부터 사용 - 중복 피하기
                for k in j + 1..<count {
                    print(cards[i], cards[j], cards[k])
                    let sum = cards[i] + cards[j] + cards[k]
                    if (currentMax...totalMax).contains(sum) {
                        currentMax = sum
                    }
                }
            }
        }
        print(currentMax)
    }
    
    func q2822() { // 점수 계산
        var scoreArr: [(score: Int, index: Int)] = []
        var sum = 0
        var sumArr: [Int] = []
        (1...8).forEach { i in
            scoreArr.append((score: Int(readLine()!)!, index: i))
        }
        scoreArr.sort { before, after in
            before.score > after.score // 방향이 중요..
        }
        (0..<5).forEach { i in
            sum += scoreArr[i].score
            sumArr.append(scoreArr[i].index)
        }
        sumArr.sort()
        print(sum)
        sumArr.indices.forEach { index in
            print(sumArr[index], terminator: " ")
        }
    }
    
    func q2846() { // 오르막길
        //        let count = Int(readLine()!)!
        //        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        //        var previousValue = 0
        //        var uphill: [Int] = []
        //        var maxUphillHeight = 0
        //        for index in inputArr.indices {
        //            let input = inputArr[index]
        //            if previousValue != 0 {
        //                if input - previousValue > 0 { // 오르막
        //                    if uphill.isEmpty {
        //                        uphill.append(previousValue)
        //                    }
        //                    uphill.append(input)
        //                }
        //                if input - previousValue <= 0 || index == (inputArr.indices.endIndex - 1) { // 오르막이 아니거나, 입력의 끝인 경우
        //                    if !uphill.isEmpty {
        //                        let uphillHeight = uphill.max()! - uphill.min()!
        //                        if uphillHeight > maxUphillHeight {
        //                            maxUphillHeight = uphillHeight
        //                        }
        //                        uphill = []
        //                    }
        //                }
        //            }
        //            previousValue = input
        //        }
        //        print(maxUphillHeight)
        let count = Int(readLine()!)!
        let inputArr = readLine()!.split(separator: " ").map { Int($0) }
        var uphillStart = inputArr[0]! // 시작점과 끝점을 첫 요소로 할당
        var uphillEnd = inputArr[0]!
        var answer = 0
        for i in 1..<count { // 두번째 요소부터 끝까지 비교
            let input = inputArr[i]!
            if input <= uphillEnd { // 오르막이 아닌 경우
                uphillStart = input // 오르막 시작점, 끝점을 현재 요소로 재설정
                uphillEnd = input
            } else { // 오르막인 경우
                uphillEnd = input // 오르막 끝점을 현재로 설정. 시작점은 그대로이므로 거리가 생기게 된다
            }
            answer = max(answer, uphillEnd - uphillStart)
            print("오르막 : \(uphillStart) 부터 \(uphillEnd) 까지")
        }
        print(answer)
        
    }
    
    func q2857() { // FBI
        var answer: [Int] = []
        (1...5).forEach { number in
            let agent = readLine()!
            if agent.contains("FBI") {
                answer.append(number)
            }
        }
        if answer.isEmpty {
            print("HE GOT AWAY!")
        } else {
            answer.forEach { print($0, terminator: " ")}
        }
    }
    
    func q2947() { // 나무 조각
        
        var inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        var index = 0
        while inputArr != [1, 2, 3, 4, 5] {
            if index == inputArr.count - 1 {
                index = 0
                continue
            }
            if inputArr[index] > inputArr[index + 1] {
                inputArr.swapAt(index, index + 1)
                inputArr.forEach{ print($0, terminator: " ") }
                print("")
            }
            index += 1
        }
    }
    
    func q2953() { // 나는 요리사다
        var num = 0
        var score = 0
        (1...5).forEach { number in
            let inputSum = readLine()!.split(separator: " ").map { Int($0)! }.reduce(0, +)
            if inputSum > score {
                score = inputSum
                num = number
            }
        }
        print(num, score)
    }
    
    func q2966() { // 찍기
        let count = Int(readLine()!)!
        let answers = readLine()!.map { String($0) }
        let student1 = ["A", "B", "C"]
        let student2 = ["B", "A", "B", "C"]
        let student3 = ["C", "C", "A", "A", "B", "B"]
        var student1Score = 0
        var student2Score = 0
        var student3Score = 0
        for number in (0..<count) {
            let answer = answers[number]
            if answer == student1[number % student1.count] {
                student1Score += 1
            }
            if answer == student2[number % student2.count] {
                student2Score += 1
            }
            if answer == student3[number % student3.count] {
                student3Score += 1
            }
        }
        let maxScore = max(student1Score, student2Score, student3Score)
        print(maxScore)
        if maxScore == student1Score {
            print("Adrian")
        }
        if maxScore == student2Score {
            print("Bruno")
        }
        if maxScore == student3Score {
            print("Goran")
        }
    }
    
    func q3004() { // 체스판 조각
        let cut = Int(readLine()!)!
        var answer = 0
        if cut == 1 {
            answer = 2
        } else if cut == 2 {
            answer = 4
        } else {
            if cut % 2 == 1 {
                let cutHalf = (cut + 1) / 2
                answer = 2 + (2...cutHalf).reduce(0, +) * 2
            } else {
                let cutHalf = cut / 2
                answer = 2 + (2...cutHalf).reduce(0, +) * 2 + (cut / 2 + 1)
            }
        }
        print(answer)
    }
    
    func q3035() { // 스캐너
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        let r = inputArr[0]
        let c = inputArr[1]
        let zr = inputArr[2] // 세로
        let zc = inputArr[3] // 가로
        var answer: [String] = []
        for _ in (1...r) {
            var input = readLine()!
            var line = ""
            for _ in (1...zr) {
                for char in input {
                    for _ in (1...zc) {
                        line.append(char)
                    }
                }
                answer.append(line)
                line = ""
            }
        }
        answer.forEach { print($0) }
    }
    
    func q3040() { // 백설 공주와 일곱 난쟁이 (= 일곱 난쟁이)
        var inputArr: [Int] = []
        (1...9).forEach { _ in
            inputArr.append(Int(readLine()!)!)
        }
        let sum = inputArr.reduce(0, +)
        let remain = sum - 100
    outerLoop: for i in inputArr.indices {
            for j in inputArr.indices {
                let a = inputArr[i]
                let b = inputArr[j]
                if i != j && inputArr[i] + inputArr[j] == remain {
                    inputArr.remove(at: inputArr.firstIndex(of: a)!)
                    inputArr.remove(at: inputArr.firstIndex(of: b)!)
                    break outerLoop // 매우 필요!
                }
            }
        }
        inputArr.forEach { print($0) }
    }
    
    func q3047() { // ABC
        var input = readLine()!.split(separator: " ").map { Int($0)! }
        input = input.sorted()
        let order = readLine()!
        for char in order {
            switch char {
            case "A":
                print(input[0], terminator: " ")
            case "B":
                print(input[1], terminator: " ")
            case "C":
                print(input[2], terminator: " ")
            default:
                break
            }
        }
    }
    
    func q4447() { // 좋은놈 나쁜놈
        let count = Int(readLine()!)!
        for _ in 1...count {
            let input = readLine()!
            var countG = 0
            var countB = 0
            for char in input {
                if char.lowercased() == "g" {
                    countG += 1
                }
                if char.lowercased() == "b" {
                    countB += 1
                }
            }
            if countG > countB {
                print("\(input) is GOOD")
            }
            if countG < countB {
                print("\(input) is A BADDY")
            }
            if countG == countB {
                print("\(input) is NEUTRAL")
            }
        }
    }
    
    func q4458() { // 첫 글자를 대문자로
//        let count = Int(readLine()!)!
//        var answer: [String] = []
//        if count <= 0 {
//            return
//        }
//        (1...count).forEach { _ in
//            let input = readLine()!
//            let startIndex = input.startIndex
//            if input[startIndex].isLowercase {
//                print(input[startIndex].uppercased() + input[input.index(after: startIndex)...input.index(before: input.endIndex)])
//            }
//            if input[startIndex].isUppercase {
//                print(input)
//            }
//        }
        
        let count = Int(readLine()!)!
        (1...count).forEach { _ in
            var input = readLine()!
            let first = input[input.startIndex].uppercased()
            input.removeFirst()
            print(first + input)
        }
    }
    
    func q4493() { // 가위 바위 보?
        let count = Int(readLine()!)!
        (1...count).forEach { num in
            let game = Int(readLine()!)!
            var score1 = 0
            var score2 = 0
            (1...game).forEach { _ in
                let inputArr = readLine()!.split(separator: " ")
                if inputArr.contains("R") && inputArr.contains("S") { // O(n)..
                    if inputArr.first! == "R" {
                        score1 += 1
                    } else {
                        score2 += 1
                    }
                }
                if inputArr.contains("S") && inputArr.contains("P") {
                    if inputArr.first! == "S" {
                        score1 += 1
                    } else {
                        score2 += 1
                    }
                }
                if inputArr.contains("P") && inputArr.contains("R") {
                    if inputArr.first! == "P" {
                        score1 += 1
                    } else {
                        score2 += 1
                    }
                }
            }
            print(score1, score2)
            if score1 > score2 {
                print("Player 1")
            } else if score1 < score2 {
                print("Player 2")
            } else {
                print("TIE")
            }
        }
    }

    func q4504() { // 배수 찾기
        let multiple = Int(readLine()!)!
        while let input = Int(readLine()!), input != 0 {
            if input % multiple == 0 {
                print("\(input) is a multiple of \(multiple).")
            } else {
                print("\(input) is NOT a multiple of \(multiple).")
            }
        }
    }
    
    func q4880() { // 다음수
        while let input = readLine(), input != "0 0 0" {
            let inputArr = input.split(separator: " ").map { Int($0)! }
            if inputArr[2] - inputArr[1] == inputArr[1] - inputArr[0] {
                print("AP \(inputArr[2] + (inputArr[2] - inputArr[1]))")
            } else if inputArr[2] / inputArr[1] == inputArr[1] / inputArr[0] {
                print("GP \(inputArr[2] * (inputArr[2] / inputArr[1]))")
            }
        }
    }
    
    func q5032() { // 탄산 음료
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        var bottle = inputArr[0] + inputArr[1]
        let exchange = inputArr[2]
        var cola = 0
        while bottle >= exchange {
            cola += bottle / exchange // 몫
            bottle = bottle / exchange + bottle % exchange // 바꾼 콜라도 다 먹고 빈병에 다시 더해야 함
        }
        print(cola)
    }
    
    func q5054() { // 주차의 신
        let count = Int(readLine()!)!
        (1...count).forEach { _ in
            let num = Int(readLine()!)!
            let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
            print((inputArr.max()! - inputArr.min()!) * 2)
        }
    }
    
    func q5063() { // TGN
        let count = Int(readLine()!)!
        (1...count).forEach { _ in
            let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
            // 광고수익 - 광고비용 > 광고 안했을때 수익 : 해야함
            // 광고수익 - 광고비용 = 광고 안했을때 수익 : 노상관
            // 광고수익 - 광고비용 < 광고 안했을때 수익 : 하지마
            let r = inputArr[0] // 광고 안했을때 수익
            let e = inputArr[1] // 광고 했을떄 수익
            let c = inputArr[2] // 광고 비용
            if e - c > r {
                print("advertise")
            }
            if e - c < r {
                print("do not advertise")
            }
            if e - c == r {
                print("does not matter")
            }
        }
    }
}
