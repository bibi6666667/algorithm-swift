//
//  5585.swift
//  BaekJoon
//
//  Created by Bibi on 2022/08/09.
//

import Foundation

class Q5585 { // 거스름돈
    
    func execute() {
        var price = Int(readLine()!)!
        var change = 1000 - price
        var count = 0
        count += change / 500 // 500엔을 몇번 내야하는지
        change = change % 500 // 500엔을 최대로 내고 남은 돈
        count += change / 100
        change = change % 100
        count += change / 50
        change = change % 50
        count += change / 10
        change = change % 10
        count += change / 5
        change = change % 5
        count += change / 1
        change = change % 1
        
        print(count)
    }
    
}
