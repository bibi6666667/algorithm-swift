//
//  AnimalCrossing.swift
//  BaekJoon
//
//  Created by Bibi on 2022/08/04.
//

import Foundation

class AnimalCrossing {
    
    
//    먹보 = Lazy = 63
//    운동광 = Jock = 57
//    무뚝뚝 = Cranky = 57
//    느끼함 = Smug = 37 <- 잭슨 
//    친절함 = Normal = 63
//    아이돌 = Peppy = 53
//    성숙함 = Snooty = 57
//    단순활발 = BigSister = 26
    enum Personality: String {
        case Lazy
        case Jock
        case Cranky
        case Smug
        case Normal
        case Peppy
        case Snooty
        case BigSister
    
        var count: Int {
            switch self {
            case .Lazy:
                return 63
            case .Jock:
                return 57
            case .Cranky:
                return 57
            case .Smug:
                return 37
            case .Normal:
                return 63
            case .Peppy:
                return 53
            case .Snooty:
                return 57
            case .BigSister:
                return 26
            }
        }
    }
    
    private var 먹보met = 0
    private var 운동광met = 0
    private var 무뚝뚝met = 0
    private var 느끼함met = 0
    private var 친절함met = 0
    private var 아이돌met = 0
    private var 성숙함met = 0
    private var 단순활발met = 0
    
    private var 먹보List: [String] = []
    private var 운동광List: [String] = []
    private var 무뚝뚝List: [String] = []
    private var 느끼함List: [String] = []
    private var 친절함List: [String] = []
    private var 아이돌List: [String] = []
    private var 성숙함List: [String] = []
    private var 단순활발List: [String] = []
    
    func execute() {
        var endFlag = true
        print("주민목록 입력")
        while endFlag {
            let inputStr = readLine()!
            
            if inputStr == "***" {
                endFlag = false
                break
            }
            
            let inputArr = inputStr.split(separator: " ")
            let name = String(inputArr[1])
            let personality = String(inputArr[2])
            if personality.contains(Personality.Lazy.rawValue) {
                먹보met += 1
                먹보List.append(name)
            }
            if personality.contains(Personality.Jock.rawValue) {
                운동광met += 1
                운동광List.append(name)
            }
            if personality.contains(Personality.Cranky.rawValue) {
                무뚝뚝met += 1
                무뚝뚝List.append(name)
            }
            if personality.contains(Personality.Smug.rawValue) {
                느끼함met += 1
                느끼함List.append(name)
            }
            if personality.contains(Personality.Normal.rawValue) {
                친절함met += 1
                친절함List.append(name)
            }
            if personality.contains(Personality.Peppy.rawValue) {
                아이돌met += 1
                아이돌List.append(name)
            }
            if personality.contains(Personality.Snooty.rawValue) {
                성숙함met += 1
                성숙함List.append(name)
            }
            if personality.contains(Personality.BigSister.rawValue) {
                단순활발met += 1
                단순활발List.append(name)
            }
        }
    }
    
    func calculatePossibility(personality: Personality) -> Double {
        var alreadyMetCount = 0
        var alreadyMetList: [String] = []
        let totalCount = personality.count
        switch personality {
        case .Lazy:
            alreadyMetCount = 먹보met
            alreadyMetList = 먹보List
        case .Jock:
            alreadyMetCount = 운동광met
            alreadyMetList = 운동광List
        case .Cranky:
            alreadyMetCount = 무뚝뚝met
            alreadyMetList = 무뚝뚝List
        case .Smug:
            alreadyMetCount = 느끼함met
            alreadyMetList = 느끼함List
        case .Normal:
            alreadyMetCount = 친절함met
            alreadyMetList = 친절함List
        case .Peppy:
            alreadyMetCount = 아이돌met
            alreadyMetList = 아이돌List
        case .Snooty:
            alreadyMetCount = 성숙함met
            alreadyMetList = 성숙함List
        case .BigSister:
            alreadyMetCount = 단순활발met
            alreadyMetList = 단순활발List
        }
        print("- 이미 만난 \(personality.rawValue) 성격 주민은 \(alreadyMetCount) 명")
        print("- 이미 만난 \(personality.rawValue) 성격 주민 목록은 \(alreadyMetList)")
        print("- 전체 \(personality.rawValue) 성격 주민은 \(totalCount) 명")
        return (1.0 / Double(totalCount - alreadyMetCount)) * 100
    }
}
