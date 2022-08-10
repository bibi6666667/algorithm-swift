//
//  17413.swift
//  BaekJoon
//
//  Created by Bibi on 2022/07/31.
//

import Foundation

// 17413 단어 뒤집기 2

class WordReverser2 {
    
    private var stack = ""
    private var tagFlag = false
    private var printLine = ""
    
    func execute() {
        var inputStr = readLine()!
        inputStr += " " // 종결문자를 다른 문자로??
        for char in inputStr {
            let charStr = String(char)
            if charStr == "<" {
                printLine.append(String(stack.reversed()))
                stack = ""
                tagFlag = true
                printLine.append(charStr)
                continue
            }
            if charStr == ">" {
                tagFlag = false
                printLine.append(charStr)
                continue
            }
            if tagFlag { // tag이면
                printLine.append(charStr)
                continue
            }
            if !tagFlag && charStr != " " { // tag도 아니고 공백도 아니면 스택으로 넣기
                stack.append(charStr)
            }
            if charStr == " " {
                printLine.append(String(stack.reversed()) + " ") // 스택의 문자 뒤집어 출력
                stack = ""
            }
        }
        let startIndex = printLine.startIndex
        let endIndex = printLine.index(printLine.endIndex, offsetBy: -2)
        print(printLine[startIndex...endIndex]) // 맨 끝 공백 빼고 출력
    }

}
