//
//  File.swift
//  BaekJoon
//
//  Created by Bibi on 2022/07/26.
//

import Foundation

class KingChobo {
    
    func q1000() { // A + B
        let input = readLine()!
        let inputArr = input.components(separatedBy: " ")
        print(inputArr.reduce(0, { $0 + Int($1)! }))
    }
    
    func q1001() { // A - B
        let input = readLine()!
        let inputArr = input.components(separatedBy: " ")
        print(Int(inputArr[0])! - Int(inputArr[1])!)
    }
    
    func q1330() { // 두 수 비교하기
        let input = readLine()!
        let inputArr = input.components(separatedBy: " ")
        let a = Int(inputArr[0])!
        let b = Int(inputArr[1])!
        if a == b {
            print("==")
        }
        if a > b {
            print(">")
        }
        if a < b {
            print("<")
        }
    }
    
    func q1550() { // 16진수
        //16진수 -> 10진수
        let input16 = readLine()!
        print(Int(input16, radix: 16)!)
    }
    
    func q2558() { // A + B - 2
        let a = Int(readLine()!)!
        let b = Int(readLine()!)!
        print(a + b)
    }
    
    func q2741() { // N찍기
        let input = Int(readLine()!)!
        let arr = Array(1...input)
        arr.forEach {
            print($0)
        }
    }
    
    func q2742() { // 기찍N
        let input = Int(readLine()!)!
        let arr = Array(1...input)
        arr.forEach {
            print(input + 1 - $0)
        }
    }
    
    func q2752() { // 세수정렬
        let input = readLine()!
        let inputArr = input.components(separatedBy: " ")
        let sortedArr = inputArr.map { Int($0)! }
            .sorted() // 숫자인지 문자인지 확인할것!
        sortedArr.forEach {
            print($0)
        }
    }
    
    func q2753() { // 윤년
        let input = Int(readLine()!)!
        if input % 400 == 0 {
            print(1)
            return
        }
        if input % 4 == 0 && input % 100 != 0 {
            print(1)
            return
        }
        print(0)
        return
    }
    
    func q4101() { // 크냐?
        var inputList: [(x: Int, y: Int)] = []
        var flag = true
        while (flag) {
            let input = readLine()!
            let inputArr = input.components(separatedBy: " ")
            let x = Int(inputArr[0])!
            let y = Int(inputArr[1])!
            if (x == 0 && y == 0) {
                flag = false
                break // 0 0 이면 판단하지 않음
            }
            inputList.append((x, y))
        }
        inputList.forEach {
            if $0 > $1 {
                print("Yes")
            } else {
                print("No")
            }
        }
    }
    
    func q4562() { // No Brainer
        let count = Int(readLine()!)!
        var inputArr: [String] = []
        for _ in 1...count {
            inputArr.append(readLine()!)
        }
        inputArr.forEach { str in
            let intArr = str.components(separatedBy: " ").map { Int($0)! }
            if intArr[0] < intArr[1] {
                print("NO BRAINS")
            } else {
                print("MMM BRAINS")
            }
        }
    }
    
    func q4892() { // 숫자 맞추기 게임
        var flag = true
        var inputList: [Int] = .init()
        while (flag) {
            let input = Int(readLine()!)!
            if input == 0 {
                flag = false
                break
            }
            inputList.append(input)
        }
        for index in inputList.indices {
            let n0 = inputList[index]
            let n1 = n0 * 3
            var n2 = 0
            var n2Value = ""
            if (n1 % 2 == 0) {
                n2 = n1 / 2
                n2Value = "even"
            } else {
                n2 = (n1 + 1) / 2
                n2Value = "odd"
            }
            let n3 = n2 * 3
            let n4 = n3 / 9
            print("\(index + 1). \(n2Value) \(n4)")
        }
    }
    
    func q5217() { // 쌍의 합 - 수의 범위에 따라 예외처리를 잘 해주자.
        let count = Int(readLine()!)!
        var inputArr: [Int] = []
        for _ in 1...count {
            inputArr.append(Int(readLine()!)!)
        }
        for index in inputArr.indices {
            let number = inputArr[index]
            var pairList: [(Int, Int)] = []
            var message = "Pairs for \(number): "
            if number == 1 || number == 2 {
                print(message)
                continue
            }
            let 몫 = number / 2
            for n in 1...몫 {
                let substracted = number - n
                if n == substracted {
                    continue
                }
                if !pairList.isEmpty {
                    message.append(", ")
                }
                message.append("\(n) \(substracted)")
                pairList.append((n, substracted))
            }
            print(message)
        }
    }
    
    func q5337() { // 웰컴
        print(".  .   .")
        print("|  | _ | _. _ ._ _  _")
        print("|/\\|(/.|(_.(_)[ | )(/.")
    }
    
    /// 7/27
    func q5338() { // 마이크로소프트 로고
        print("       _.-;;-._")
        print("'-..-'|   ||   |")
        print("'-..-'|_.-;;-._|")
        print("'-..-'|   ||   |")
        print("'-..-'|_.-''-._|")
    }
    
    func q5339() { // 콜센터
        print("     /~\\")
        print("    ( oo|")
        print("    _\\=/_")
        print("   /  _  \\")
        print("  //|/.\\|\\\\")
        print(" ||  \\ /  ||")
        print("============")
        print("|          |")
        print("|          |")
        print("|          |")
    }
    
    func q5522() { // 카드 게임
        var inputArr: [Int] = []
        for _ in 1...5 {
            inputArr.append(Int(readLine()!)!)
        }
        print(inputArr.reduce(0, { $0 + $1 }))
    }
    
    func q6749() { // Next in line
        let young = Int(readLine()!)!
        let middle = Int(readLine()!)!
        print(middle + (middle - young))
    }
    
    func q6778() { // Which Alien?
        let antenna = Int(readLine()!)!
        let eye = Int(readLine()!)!
        if antenna >= 3 && eye <= 4 {
            print("TroyMartian")
        }
        if antenna <= 6 && eye >= 2 {
            print("VladSaturnian")
        }
        if antenna <= 2 && eye <= 3 {
            print("GraemeMercurian")
        }
    }
    
    func q6810() { // ISBN
        let first = Int(readLine()!)!
        let second = Int(readLine()!)!
        let third = Int(readLine()!)!
        let sum = 9 * 1 + 7 * 3 + 8 * 1 + 0 * 3 + 9 * 1 + 2 * 3 + 1 * 1 + 4 * 3 + 1 * 1 + 8 * 3 + first * 1 + second * 3 + third * 1
        print("The 1-3-sum is \(sum)")
    }
    
    func q7287() { // 등록
        print(33)
        print("bibi")
    }
    
    func q7891() { // Can you add this?
        let count = Int(readLine()!)!
        for _ in 1...count {
            let input = readLine()!
            let inputArr = input.components(separatedBy: " ")
            print(Int(inputArr[0])! + Int(inputArr[1])!)
        }
    }
    
    func q8370() { // Plane
        let input = readLine()!
        let inputArr = input.components(separatedBy: " ").map{ Int($0)! }
        let sum = inputArr[0] * inputArr[1] + inputArr[2] * inputArr[3]
        print(sum)
    }
    
    func q8393() { // 합
        let input = Int(readLine()!)!
        var sum = 0
        for num in 1...input {
            sum += num
        }
        print(sum)
    }
    
    func q9316() { // Hello Judge
        let count = Int(readLine()!)!
        for num in 1...count {
            print("Hello World, Judge \(num)!")
        }
    }
    
    func q9653() { // 스타워즈 로고
        print("    8888888888  888    88888")
        print("   88     88   88 88   88  88")
        print("    8888  88  88   88  88888")
        print("       88 88 888888888 88   88")
        print("88888888  88 88     88 88    888888")
        print("")
        print("88  88  88   888    88888    888888")
        print("88  88  88  88 88   88  88  88")
        print("88 8888 88 88   88  88888    8888")
        print(" 888  888 888888888 88  88      88")
        print("  88  88  88     88 88   88888888")
    }
    
    func q9654() { // 나부 함대 데이터
        print("SHIP NAME      CLASS          DEPLOYMENT IN SERVICE")
        print("N2 Bomber      Heavy Fighter  Limited    21        ")
        print("J-Type 327     Light Combat   Unlimited  1         ")
        print("NX Cruiser     Medium Fighter Limited    18        ")
        print("N1 Starfighter Medium Fighter Unlimited  25        ")
        print("Royal Cruiser  Light Combat   Limited    4         ")
    }
    
    func q9713() { // Sum of Odd Sequence
        // 주어진 모든 홀수를 더하는 게 아니라, 1 ~ 주어진 홀수 사이의 홀수를 모두 더하는 문제
        let count = Int(readLine()!)!
        for _ in 1...count {
            let int = Int(readLine()!)!
            var sum = 0
            for i in 1...int {
                if i % 2 != 0 {
                    sum += i
                }
            }
            print(sum)
        }
    }
    
    func q10093() { // 숫자
        // 예외처리가 중요. 값이 없으면 빈 문자열 출력해야.
        let input = readLine()!
        let inputArr = input.components(separatedBy: " ").map { Int($0)! }.sorted()
        let a = inputArr[0]
        let b = inputArr[1]
        var gap = b - a - 1
        if a == b || a + 1 == b {
            gap = 0
            print(gap)
            print("")
        } else {
            print(gap)
            for i in a+1..<b {
                print(i, terminator: " ")
            }
        }
    }
    
    func q10172() { // 개
        print("|\\_/|")
        print("|q p|   /}")
        print("( 0 )\"\"\"\\")
        print("|\"^\"`    |")
        print("||_/=\\\\__|")
    }
    
    func q10699() { // 오늘 날짜
        // locale, timezone 줬는데도 안되길래 그냥 오늘날짜 출력..
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy-MM-dd"
        print(formatter.string(from: Date()))
    }
    
    func q10817() { // 세 수
        let input = readLine()!
        let intArr = input.split(separator: " ").map { Int($0)! }
        print(intArr.sorted()[1])
    }
    
    func q10926() { // ??!
        let input = readLine()!
        print(input + "??!")
    }
    
    func q11104() { // Fridge of your Dreams
        // 2진수 -> 10진수
        let count = Int(readLine()!)!
        for _ in 1...count {
            let binary = readLine()!
            let decimal = Int(binary, radix: 2)!
            print(decimal)
        }
    }
    
    func q11319() { // Count Me In
        let count = Int(readLine()!)!
        let vowelList = ["a", "e", "i", "o", "u"]
        for _ in 1...count {
            let sentence = readLine()!.lowercased()
            var consonants = 0
            var vowels = 0
            for char in sentence {
                if char == " " {
                    continue
                }
                if vowelList.contains(String(char)) {
                    vowels += 1
                } else {
                    consonants += 1
                }
            }
            print(consonants, vowels)
        }
    }
    
    func q11367() { // Report Card Time
        let count = Int(readLine()!)!
        for _ in 1...count {
            let inputArr = readLine()!.split(separator: " ")
            let name = inputArr[0]
            let score = Int(inputArr[1])!
            var grade = ""
            switch score {
            case 97...100:
                grade = "A+"
            case 90...96:
                grade = "A"
            case 87...89:
                grade = "B+"
            case 80...86:
                grade = "B"
            case 77...79:
                grade = "C+"
            case 70...76:
                grade = "C"
            case 67...69:
                grade = "D+"
            case 60...66:
                grade = "D"
            case 0...59:
                grade = "F"
            default:
                return
            }
            print("\(name) \(grade)")
        }
    }
    
    func q11549() { // Identifying tea
        let correctAnswer = readLine()!
        let answers = readLine()!.split(separator: " ").map { String($0) }
        var answerCount = 0
        answers.forEach {
            if $0 == correctAnswer {
                answerCount += 1
            }
        }
        print(answerCount)
    }
    
    func q11654() { // 아스키 코드
        let input = readLine()!
        print(UnicodeScalar(input)!.value)
        
    }
    
    // 8/4
    func q13597() { // Tri-du
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        if inputArr[0] == inputArr[1] {
            print(inputArr[0])
        } else {
            print(inputArr.max()!)
        }
    }
    
    func q13752() { // 히스토그램
        let count = Int(readLine()!)!
        for _ in 1...count {
            let input = Int(readLine()!)!
            for _ in 1...input {
                print("=", terminator: "")
            }
            print("")
        }
    }
    
    func q14038() {
        var score = 0
        for _ in 1...6 {
            let result = readLine()!
            if result == "W" {
                score += 1
            }
        }
        if score == 0 {
            print(-1)
        } else if (5...6).contains(score) {
            print(1)
        } else if (3...4).contains(score) {
            print(2)
        } else if (1...2).contains(score) {
            print(3)
        }
    }
    
    func q14681() {
        let x = Int(readLine()!)!
        let y = Int(readLine()!)!
        
        switch (x, y) {
        case (x, y) where x > 0 && y > 0:
            print(1)
        case (x, y) where x < 0 && y > 0:
            print(2)
        case (x, y) where x < 0 && y < 0:
            print(3)
        case (x, y) where x > 0 && y < 0:
            print(4)
        default:
            print("")
        }
    }
    
    func q15372() { // A Simple Problem
        // 양의 정수 N이 주어졌을 때, K가 N의 제곱의 배수가 되게 하는 최소 양의 정수 K는?
        let count = Int(readLine()!)!
        for _ in 1...count {
            let n = Int(readLine()!)!
            let nSquare = n * n
            print(nSquare)
        }
    }
    
    func q15439() { // Vera and Outfits
        // 옷 위아래 색 같지 않게 입기
        // 3종류 : 12, 13, 21, 23, 31, 32
        // 4종류 : 12, 13, 14, 21, 23, 24, 31, 32, 34, 41, 42, 43 -> n제곱 - n
        let input = Int(readLine()!)!
        print((input * input) - input )
    }
    
    func q15700() { // 타일 채우기 4
        // 전체 너비를 구하고, 2로 나눈 몫을 구함
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        let square = inputArr[0] * inputArr[1]
        print(square / 2)
    }
    
    func q16170() { // 오늘의 날짜는?
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy"
        print(formatter.string(from: date))
        formatter.dateFormat = "MM"
        print(formatter.string(from: date))
        formatter.dateFormat = "dd"
        print(formatter.string(from: date))
    }
    
    func q17009() {
        var inputArr: [Int] = []
        for _ in 1...6 {
            let input = Int(readLine()!)!
            inputArr.append(input)
        }
        let appleScore = (inputArr[0] * 3) + (inputArr[1] * 2) + (inputArr[2] * 1)
        let bananaScore = (inputArr[3] * 3) + (inputArr[4] * 2) + (inputArr[5] * 1)
        if appleScore > bananaScore {
            print("A")
        }
        if appleScore < bananaScore {
            print("B")
        }
        if appleScore == bananaScore {
            print("T")
        }
    }
    
    func q17010() {
        let count = Int(readLine()!)!
        for _ in 1...count {
            let inputArr = readLine()!.split(separator: " ")
            let charCount = Int(inputArr[0])!
            let char = inputArr[1]
            for _ in 1...charCount {
                print(char, terminator: "")
            }
            print("")
        }
    }
    
    func q17094() { // Serious Problem
//        let count = readLine()!
//        let input = readLine()!
//        var count2 = 0
//        var countE = 0
//        for char in input {
//            let charStr = String(char)
//            if charStr == "2" {
//                count2 += 1
//            }
//            if charStr == "e" {
//                countE += 1
//            }
//        }
//        if count2 > countE {
//            print("2")
//        }
//        if count2 < countE {
//            print("e")
//        }
//        if count2 == countE {
//            print("yee")
//        }
        
        let count = readLine()!
        let input = readLine()!
        let arr2 = input.filter { $0 == "2" }
        let arrE = input.filter { $0 == "e" }
        if arr2.count > arrE.count {
            print("2")
        }
        if arr2.count < arrE.count {
            print("e")
        }
        if arr2.count == arrE.count {
            print("yee")
        }
    }
    
    func q17388() {
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        let sum = inputArr.reduce(0) { $0 + $1 }
        if sum >= 100 {
            print("OK")
        } else {
            if inputArr.min()! == inputArr[0] {
                print("Soongsil")
            }
            if inputArr.min()! == inputArr[1] {
                print("Korea")
            }
            if inputArr.min()! == inputArr[2] {
                print("Hanyang")
            }
        }
    }
    
    func q17530() {
        let count = Int(readLine()!)!
        var scoreArr: [Int] = []
        var isTied = true
        for _ in 1...count {
            let score = Int(readLine()!)!
            if !scoreArr.isEmpty && scoreArr.last! != score { // 비어있지 않고, 마지막 요소가 score와 다를 때
                isTied = false
            }
            scoreArr.append(score)
        }
        if scoreArr[0] == scoreArr.max()! || isTied {
            print("S")
        } else {
            print("N")
        }
    }
    
    func q17863() { // FYI
        let input = readLine()!
        if input.hasPrefix("555") {
            print("YES")
        } else {
            print("NO")
        }
    }
    
    func q17869() { // simple collatz sequence
        let input = Int(readLine()!)!
        var inputNum = input
        var count = 0
        while inputNum != 1 {
            if inputNum % 2 == 0 {
                inputNum = inputNum / 2
            } else {
                inputNum = inputNum + 1
            }
            count += 1
        }
        print(count)
    }
    
    func q18398() { // HOMWRK
        let count = Int(readLine()!)!
        for _ in 1...count {
            let length = Int(readLine()!)!
            for _ in 1...length {
                let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
                let sum = inputArr[0] + inputArr[1]
                let multiply = inputArr[0] * inputArr[1]
                print("\(sum) \(multiply)")
            }
        }
    }
    
    func q19532() { // 수학은 비대면강의입니다
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        let a = inputArr[0]
        let b = inputArr[1]
        let c = inputArr[2]
        let d = inputArr[3]
        let e = inputArr[4]
        let f = inputArr[5]
        let x = (c * e - f * b) / (a * e - d * b)
        let y = (c * d - a * f) / (b * d - e * a) // (c - a * x) / b
        print(x, y)
    }
    
    func q19602() { // Dog Treats
        let s = Int(readLine()!)!
        let m = Int(readLine()!)!
        let l = Int(readLine()!)!
        let score = s + (2 * m) + (3 * l)
        if score >= 10 {
            print("happy")
        } else {
            print("sad")
        }
    }
    
    func q20254() {
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        print(56 * inputArr[0] + 24 * inputArr[1] + 14 * inputArr[2] + 6 * inputArr[3])
    }
    
    func q20332() {
        let count = Int(readLine()!)!
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        let sum = inputArr.reduce(0) { $0 + $1 }
        if sum % 3 == 0 {
            print("yes")
        } else {
            print("no")
        }
    }
    
    func q20492() { // 세금
        let input = Int(readLine()!)!
        let case1 = input - (input * 22 / 100)
        let case2 = input - (input * 20 / 100 * 22 / 100)
        print(case1, case2)
    }
    
    func q20499() { // Darius님 한타 안함?
        let inputArr = readLine()!.split(separator: "/").map { Int($0)! }
        if inputArr[0] + inputArr[2] < inputArr[1] || inputArr[1] == 0 {
            print("hasu")
        } else {
            print("gosu")
        }
    }
    
    func q21300() { // bottle return
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        print(inputArr.reduce(0) { $0 + $1 } * 5)
    }
    
    func q21591() {
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        if inputArr[0] - 2 >= inputArr[2] && inputArr[1] - 2 >= inputArr[3] {
            print(1)
        } else {
            print(0)
        }
    }
    
    func q21612() { // boiling water
        let b = Int(readLine()!)!
        let p = 5 * b - 400
        var level: Int {
            var result = 0
            if p > 100 {
                result = -1
            }
            if p == 100 {
                result = 0
            }
            if p < 100 {
                result = 1
            }
            return result
        }
        print(p)
        print(level)
    }
    
    func q22938() { // 백발백준하는 명사수
        // 두 중심 사이의 거리가 각반지름의 합보다 작아야 한다
        let circle1Arr = readLine()!.split(separator: " ").map { Double($0)! }
        let circle2Arr = readLine()!.split(separator: " ").map { Double($0)! }
        let xDistance = circle1Arr[0] - circle2Arr[0]
        let yDistance = circle1Arr[1] - circle2Arr[1]
        let circleCenterDistance = sqrt(pow(xDistance, 2) + pow(yDistance, 2))
        if circleCenterDistance < circle1Arr[2] + circle2Arr[2] {
            print("YES")
        } else {
            print("NO")
        }
    }
    
    
    // 8/8
    func q22966() { // 가장 쉬운 문제를 찾는 문제
        // 튜플.max 활용
        let count = Int(readLine()!)!
        var inputArr: [(name: String, level: Int)] = []
        for _ in 1...count {
            let inputItem = readLine()!.split(separator: " ")
            let name = String(inputItem[0])
            let level = Int(inputItem[1])!
            inputArr.append((name, level))
        }
        let maxInput = inputArr.min {
            return $0.level < $1.level
        }!
        print(maxInput.0)
    }
    
    func q23037() { // 5의 수난
        let input = readLine()!
        var sum = 0.0
        for char in input {
            let digit = Double(String(char))!
            sum += pow(digit, 5)
        }
        print(Int(sum))
    }
    
    func q23795() { // 사장님 도박은 재미로 하셔야 합니다
        var sum = 0
        var endFlag = true
        while endFlag {
            let input = Int(readLine()!)!
            if input == -1 {
                endFlag = false
                break
            }
            sum += input
        }
        print(sum)
    }
    
    func q23825() { // SASA 모형을 만들어보자
        // 둘 중 작은 수를 2로 나눈 몫
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        print(inputArr.min()! / 2)
        
    }
    
    func q24568() { // Cupcake Party
        let regularBox = Int(readLine()!)!
        let smallBox = Int(readLine()!)!
        let left = (8 * regularBox + 3 * smallBox) - 28
        if left < 0 {
            print(0)
        } else {
            print(left)
        }
    }
    
    func q25238() { // 가희와 방어율 무시
        // 정수의 나눗셈은 소수점을 버리므로 오차가 발생할 수 있다. 나눗셈을 할 떄는 Double 사용하기
        let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
        let defense = inputArr[0] - (inputArr[0] * inputArr[1] / 100)
        print(defense)
        if defense >= 100 {
            print(0)
        } else {
            print(1)
        }
        
    }
    
    func test() {
    }
}
