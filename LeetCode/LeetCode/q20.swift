//
//  q20.swift
//  LeetCode
//
//  Created by Bibi on 2021/12/13.
//

import Foundation

func isValid(_ s: String) -> Bool {
    var stringStack = Array<String>()
    for char in s {
        print(char)
        switch char {
        case ")" :
            if stringStack.last == "(" {
                stringStack.removeLast()
            } else {
                return false
            }
        case "}" :
            if stringStack.last == "{" {
                stringStack.removeLast()
            } else {
                return false
            }
        case "]" :
            if stringStack.last == "[" {
                stringStack.removeLast()
            } else {
                return false
            }
        default: // case "(", "{", "["
            stringStack.append(String(char))
        }
    }
    print(stringStack)
    return stringStack.isEmpty
}
