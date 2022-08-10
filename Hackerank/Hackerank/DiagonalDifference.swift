//
//  DiagonalDifference.swift
//  Hackerank
//
//  Created by Bibi on 2022/01/26.
//

import Foundation

func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    let arrLength = arr[0][0]
    let onlyArr = Array<Array<Int>>(arr[1...arrLength])
    var leftDiagonal = 0
    var rightDiagonal = 0
    for i in 0..<arrLength {
        leftDiagonal += onlyArr[i][i]
        rightDiagonal += onlyArr[i][arrLength - 1 - i]
    }
    return abs(leftDiagonal - rightDiagonal)
}

