//
//  Kangaroo.swift
//  Hackerank
//
//  Created by Bibi on 2022/01/26.
//

import Foundation

func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    // Write your code here
    var jump1 = x1
    var jump2 = x2
    while true {
        if v1 < v2 {
            return "NO"
        }
        jump1 += v1
        jump2 += v2
        if jump1 == jump2 {
            return "YES"
        }
        if jump1 > jump2 {
            return "NO"
        }
    }
}
