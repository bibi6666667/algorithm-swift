//
//  Combination.swift
//  BaekJoon
//
//  Created by Bibi on 2022/09/08.
//

import Foundation

class Combination {
/// 조합 combination
    // 순서가 중요하지 않음.
    // 반복문으로 구현 : for반복문을 r번 반복해 구현
    func combination() {
        let array = [1, 2, 3, 4]
        var answer: [[Int]] = []
        for i in 0..<array.count {
            for j in i + 1..<array.count { // 직전 반복문에서 사용한 다음 요소를 사용해 중복 피하기
                for k in j + 1..<array.count {
                    answer.append([array[i], array[j], array[k]])
                }
            }
        }
        print(answer)
    }
    
    // 재귀로 구현 : 매 인덱스가 오름차순으로 정렬
    func getCombination<T: Comparable>(array: [T],
                                       count: Int,
                                       tempArray: [T] = [],
                                       answer: [[T]] = [],
                                       lastIndex: Int = 0) -> [[T]] {
        var currentTempArray = tempArray
        var currentAnswer = answer
        var currentLastIndex = lastIndex
        
        // 조합 중 하나가 완성된 경우
        if currentTempArray.count == count {
            currentAnswer.append(currentTempArray)
            return currentAnswer
        }
        
        for i in currentLastIndex..<array.count {
            let item = array[i]
            if tempArray.contains(item) {
                continue
            }
            currentTempArray.append(item)
            currentLastIndex += 1
            currentAnswer = getCombination(array: array, count: count, tempArray: currentTempArray, answer: currentAnswer, lastIndex: currentLastIndex)
            currentTempArray.popLast()
        }
        return currentAnswer
    }
}
