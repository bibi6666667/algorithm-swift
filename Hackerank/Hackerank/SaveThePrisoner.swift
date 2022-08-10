//
//  SaveThePrisoner.swift
//  Hackerank
//
//  Created by Bibi on 2022/01/26.
//

import Foundation

func saveThePrisoner(n: Int, m: Int, s: Int) -> Int {
    // Write your code here
    // n : the number of prisoners
    // m : the number of sweets
    // s : the chair number to start passing out treats at
    let answer = (s + (m % n) - 1) % n
    return answer == 0 ? n : answer
}
