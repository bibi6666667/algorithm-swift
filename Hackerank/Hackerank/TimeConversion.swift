//
//  TimeConversion.swift
//  Hackerank
//
//  Created by Bibi on 2022/01/26.
//

import Foundation

func timeConversion(s: String) -> String {
    // Write your code here
    var result = ""
    let timeIndex = s.index(s.startIndex, offsetBy: 7)
    let timeStr = String(s[...timeIndex])
    let ampmIndex = s.index(s.endIndex, offsetBy: -2)
    let ampmStr = String(s[ampmIndex...])
    let timeArr = timeStr.split(separator: ":")
    let hourStr = timeArr[0]
    let minuteStr = timeArr[1]
    let secondStr = timeArr[2]
    if (ampmStr == "PM" && hourStr != "12") {
        result += String(Int(hourStr)! + 12)
    } else if (ampmStr == "AM" && hourStr == "12") {
        result += "00"
    } else {
        result += hourStr
    }
    result = result + ":" + minuteStr + ":" + secondStr
    return result
}
