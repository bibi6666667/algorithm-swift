//
//  Kakao.swift
//  BaekJoon
//
//  Created by Bibi on 2022/09/24.
//

import Foundation

class Kakao {
    func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] { // 1번
        let todayArr = today.split(separator: ".").map { Int($0)! }
        let todayYear = todayArr[0]
        let todayMonth = todayArr[1]
        let todayDay = todayArr[2]
        var termArr: [String : Int] = [:]
        terms.forEach { termDead in
            let termAndDead = termDead.split(separator: " ")
            termArr[String(termAndDead[0])] = Int(termAndDead[1])!
        }
        var answer: [Int] = []
        for index in privacies.indices {
            let privacy = privacies[index]
            let splited = privacy.split(separator: " ")
            let dayArr = splited[0].split(separator: ".")
            let term = String(splited[1])
            let termDead = termArr[term]!
            let termDeadYear = termDead / 12
            let termDeadMonth = termDead % 12
            var deadLineYear = Int(dayArr[0])! + termDeadYear
            var deadLineMonth = Int(dayArr[1])! + termDeadMonth
            var deadLineDay = Int(dayArr[2])! - 1
            if deadLineDay == 0 { // 계산된 유효기간
                deadLineDay = 28
                deadLineMonth -= 1
            }
            if deadLineMonth > 12 {
                deadLineYear += deadLineMonth / 12
                deadLineMonth -= deadLineMonth % 12
                if deadLineMonth < 0 {
                    deadLineYear -= 1
                    deadLineMonth += 12
                }
            }
            if todayYear > deadLineYear ||
                todayYear == deadLineYear && todayMonth > deadLineMonth ||
                todayYear == deadLineYear && todayMonth == deadLineMonth && todayDay > deadLineDay {
                answer.append(index + 1)
            }
        }
        return answer
    }
    
    func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 { // 2번
        // cap : 트럭에 최대 실을 수 있는 택배 개수 1~50
        // n : 배달/수거할 집의 수 1~10만
        // deliveries : 각 집에 배달할 상자의 수 (길이 = n)
        // pickups : 각 집에서 수거할 상자의 수 (길이 = n)
        // 배달 먼저 하고 돌아오면서 수거
        var deliveries = deliveries
        var pickups = pickups
        var move: Int64 = 0
        while deliveries.reduce(0, +) != 0 && pickups.reduce(0, +) != 0 {
            var truckDelivery = cap
            var truckPickup = 0
            // 배달 - 제일 멀리 있는 집부터?
            //            var maxIndex = Int(deliveries.firstIndex(of: deliveries.max()!)!)
            var maxIndex = deliveries.lastIndex(where: { $0 != 0 })!
            print("maxIndex : \(maxIndex)")
            
            while truckDelivery != 0 {
                if maxIndex < 0 {
                    break
                }
                maxIndex = Int(exactly: maxIndex)!
                print("\(maxIndex + 1)째 집에서 배달 시작 : \(deliveries[maxIndex])개")
                if deliveries[maxIndex] >= truckDelivery {
                    deliveries[maxIndex] -= truckDelivery
                    truckDelivery = 0
                } else {
                    truckDelivery -= deliveries[maxIndex]
                    deliveries[maxIndex] = 0
                }
                print("트럭에 남은 택배 : \(truckDelivery)")
                maxIndex -= 1
                print("현재 위치 : \(maxIndex)")
                move += Int64((maxIndex + 1) * 2)
            }
            
            // 배달 다 하면 수거 - maxIndex나 그 앞에 있는 집부터
            if truckDelivery <= 0 {
                while truckPickup < cap {
                    if pickups[maxIndex] >= cap {
                        truckPickup += pickups[maxIndex]
                        pickups[maxIndex] = 0
                    } else {
                        pickups[maxIndex] = pickups[maxIndex] - (cap - truckPickup)
                        truckPickup += (cap - truckPickup)
                    }
                    print("트럭에 수거한 상자 : \(truckPickup)")
                    maxIndex -= 1
                }
            }
            print("물류창고에 돌아왔어요. 현재 이동거리 : \(move)")
        }
        return move
    }
    
    
    
    func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] { // 3번
        // 이모티콘 1~7개에 대한 최대 목적달성했을때의 가입자수와 매출
        // 이모티콘은 1~40% 할인. (10/20/30/40%)
        // 고객 예산은 100원 ~ 100만원 (100의 배수)
        // 이모티콘 정가 : 100원 ~ 100만원 (100의 배수)
        let saleRate = [10, 20, 30, 40]
        var maxSubscribes = 0
        var maxSales = 0
        // 이모티콘 (최대)7개에 대한 4가지 할인 경우의 수 - 반복문 순서 유의...
        let saleRatePermutationArr = getPermutation(array: saleRate, count: emoticons.count)
        for saleRateArr in saleRatePermutationArr {
            
        }
//
//
//        users.forEach { user in
//            let userRate = user[0]
//            let userBudget = user[1]
//            var userTotalSubscribes = 0
//            var userTotalSales = 0
//            for rate in saleRate {
//                var userSales = 0
//                for emoticon in emoticons {
//
//                    print("\(emoticon)원짜리 이모티콘 \(rate)% 할인")
//
//                    if userRate <= rate { // 사는 경우
//                        print("사용자가 이모티콘을 구매합니다")
//                        let price = (emoticon * (100 - rate) / 100)
//                        userSales += price
//                        print("\(price)원의 매출 발생!")
//                    }
//                }
//                if userSales > userBudget { // 예산을 넘어가면 안사고 구독
//                    print("사용자가 구매 대신 구독을 결정했습니다")
//                    userTotalSubscribes += 1
//                } else { // 예산을 넘지 않으면 그냥 삼
//                    print("사용자가 구독 대신 구매를 결정했습니다 : \(userSales)원 매출 발생")
//                    userTotalSales += userSales
//                }
//                userSales = 0
//            }
//
//            if userTotalSubscribes > maxSubscribes { // 현재 구독자수가 더 높다면 모두 갱신
//                maxSubscribes = userTotalSubscribes
//                maxSales = userTotalSales
//            } else if userTotalSales > maxSales { // 그렇진 않지만 매출액이 더 높다면 매출액만 갱신
//                maxSales = userTotalSales
//            }
//            print("현재 총 가입자수 : \(maxSubscribes)")
//            print("현재 총 매출 : \(maxSales)")
//            print("--------------------------")
//        }
        return [maxSubscribes, maxSales]
    }
    
    func getPermutation<T: Hashable> (array: [T],
                                      count: Int,
                                      tempArray: [T] = [], // 순열 중 하나를 임시 저장
                                      answer: [[T]] = [],
                                      usingItems: Set<T> = []) -> [[T]] { // 어떤 숫자가 사용중이라면 여기에 포함, 아니라면 뺀다
        var currentTempArray = tempArray
        var currentAnswer = answer
        var currentUsingItems = usingItems
        
        if currentTempArray.count == count { // 순열 중 하나가 완성된 경우
            currentAnswer.append(currentTempArray)
            return currentAnswer
        }
        
        // 사용중이지 않은 요소 중 하나를 사용해 순열을 구성
        for item in array {
//            if currentUsingItems.contains(item) {
//                continue
//            }
            currentUsingItems.insert(item)
            currentTempArray.append(item)
            currentAnswer = getPermutation(array: array, count: count, tempArray: currentTempArray, answer: currentAnswer, usingItems: currentUsingItems)
            currentTempArray.popLast()
            currentUsingItems.remove(item)
        }
        return currentAnswer
    }
}
