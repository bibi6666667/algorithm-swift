//
//  Permutation.swift
//  BaekJoon
//
//  Created by Bibi on 2022/09/08.
//

import Foundation

class Permutation {
/// 순열 permutation
    // 길이가 n인 배열에서 r개의 요소를 차례대로 뽑아 새로운 배열을 만든다.
    // 반복문 : for문을 r번 중첩 - i, j, k의 중복을 배제한다
    func permutation() {
        // (n = 4, r = 3)길이 4인 배열에서 3개의 요소 뽑기
        let array = [1, 2, 3, 4]
        var answer: [[Int]] = []
        for i in array.indices { // r번 중첩
            for j in array.indices {
                for k in array.indices {
                    if (i == j || j == k || k == i) {
                        continue
                    }
                    let arr = [array[i], array[j], array[k]] // 길이 r
                    answer.append(arr)
                }
            }
        }
        print(answer)
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
            print(currentAnswer)
            return currentAnswer
        }
        
        // 사용중이지 않은 요소 중 하나를 사용해 순열을 구성
        for item in array {
            if currentUsingItems.contains(item) {
                continue
            }
            currentUsingItems.insert(item)
            currentTempArray.append(item)
            currentAnswer = getPermutation(array: array, count: count, tempArray: currentTempArray, answer: currentAnswer, usingItems: currentUsingItems)
            currentTempArray.popLast()
            currentUsingItems.remove(item)
        }
        return currentAnswer
    }
    
    // usingItems를 쓰지 않는 풀이 - Set을 쓰지 않으므로 속도는 조금 더 느리다
    // Set을 쓰지 않는 대신 tempArray에 해당 원소가 포함되어 있는지(사용중인지)를 체크함
    func getPermutation2<T: Hashable> (array: [T],
                                      count: Int,
                                      tempArray: [T] = [],
                                      answer: [[T]] = []) -> [[T]] {
        var currentTempArray = tempArray
        var currentAnswer = answer
        
        if currentTempArray.count == count {
            currentAnswer.append(currentTempArray)
            return currentAnswer
        }
        
        for item in array {
            if tempArray.contains(item) {
                continue
            }
            currentTempArray.append(item)
            currentAnswer = getPermutation2(array: array, count: count, tempArray: currentTempArray, answer: currentAnswer)
            currentTempArray.popLast()
        }
        return currentAnswer
    }
    
}
