//
//  10162.swift
//  BaekJoon
//
//  Created by Bibi on 2022/08/08.
//

import Foundation

class Microwave {
    func execute() {
        let input = Int(readLine()!)!
        // A = 300sc, B = 60sc, C = 10sc
        var time = input
        var aCount = 0
        var bCount = 0
        var cCount = 0
        if time >= 300 {
            aCount = time / 300
            time = time % 300
        }
        if time >= 60 {
            bCount = time / 60
            time = time % 60
        }
        if time >= 10 {
            cCount = time / 10
            time = time % 10
        }

        if time == 0 {
            print(aCount, bCount, cCount)
        } else {
            print(-1)
        }
    }
}
