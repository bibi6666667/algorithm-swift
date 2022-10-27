import Foundation

//print(kingChobo.solution(
//    [["2022-06-24T23:57:42", "정원", "민탁님"], ["2022-06-24T23:57:44", "정원", "생일이 얼마 안남으셨네요"], ["2022-06-24T23:57:54", "정원", "소감 한말씀 부탁드립니닼ㅋㅋㅋ"], ["2022-06-24T23:58:02", "금상", "오~ 민탁님 내일 생일이세요? 축하해요!"], ["2022-06-24T23:58:05", "민탁", "으악 감사해요 이렇게 늦은저녁까지 챙겨주시고ㅠㅠ!"], ["2022-06-24T23:58:34", "도현", "민탁님 축하드려요~~!"], ["2022-06-24T23:58:36", "도현", ""], ["2022-06-24T23:58:55", "금상", "민탁님"], ["2022-06-24T23:59:01", "금상", "생일기념 내일 뭐하시나요~"], ["2022-06-24T23:59:10", "정원", "가족과 여행?"], ["2022-06-24T23:59:12", "금상", "해외여행 가시는건가요!!"], ["2022-06-24T23:59:55", "민탁", "일주일쉬면서 가족하고 하와이갑니다~~ 축하감사해요 모두!"], ["2022-06-25T00:00:01", "정원", "이제 진짜 생일되셨네요!! 축하합니다!!"], ["2022-06-25T00:01:05", "민탁", ""]]
//    ))

// 같은 분 내에 작성자가 같으면 묶기, 분 단위가 변경되면 분리
// 분리 기준 : 분 단위가 변경되거나 작성자가 변경되면.
// 분리 o : 이름, 내용, 시간
// 분리 x : 내용
// 메시지 마지막에 시간 (HH:mm)
// 날짜가 바뀌면 날짜 분기 추가
// "" = 삭제된 메시지

class CodingTest {
    func solution(_ messages:[[String]]) -> [String] {
        var answer: [String] = []
        var previousDateTime = ""
        var previousWriter = ""
        
        for index in messages.indices {
            let message = messages[index]
            let dateTime = message[0]
            let writer = message[1]
            let content = message[2]
            
            if previousDateTime != "" {
                let messageDate = getDate(dateTime)
                let previousDate = getDate(previousDateTime)
                let messageTime = getTime(dateTime)
                let previousTime = getTime(previousDateTime)
                
                if messageTime != previousTime || writer != previousWriter {
                    answer.append(previousTime)
                }
                
                if messageDate != previousDate {
                    answer.append(messageDate)
                }
                
                if writer != previousWriter { // 작성자가 다르면, 시간이 같은지 다른지와 관계없이 작성자, 내용, 시간 출력
                    answer.append("[\(writer)]")
                    answer.append(convertDeletedMessage(content))
                }
                if writer == previousWriter && messageTime != previousTime { // 작성자가 같지만 시간은 다르면, 작성자와 내용과 시간 출력
                    answer.append("[\(writer)]")
                    answer.append(convertDeletedMessage(content))
                }
                if writer == previousWriter && messageTime == previousTime { // 작성자도 같고 시간도 같으면, 내용만 표시
                    answer.append(convertDeletedMessage(content))
                }
                
                if Int(index) == messages.endIndex - 1 {
                    answer.append(messageTime)
                }
            }
            
            if previousDateTime == "" { // 입력의 시작
                answer.append("[\(writer)]")
                answer.append(convertDeletedMessage(content))
            }
            previousDateTime = dateTime
            previousWriter = writer
        }
        
        return answer
    }
    
    func convertDeletedMessage(_ message: String) -> String {
        if message == "" {
            return "<삭제된 메시지>"
        }
        return message
    }
    
    func getDate(_ dateTime: String) -> String {
        return "-- \(String(dateTime.split(separator: "T")[0])) --"
    }
    
    func getTime(_ dateTime: String) -> String {
        let hhmmss = String(dateTime.split(separator: "T")[1])
        let hhmmssArr = hhmmss.split(separator: ":")
        let hourMinute = "(\(hhmmssArr[0]):\(hhmmssArr[1]))"
        return hourMinute
    }
    
    
    //
    
    func solution(_ n:Int, _ keyInputs:[Int]) -> String {
        let limit = n
        var answer = ""
        
        if keyInputs.count < limit {
            return ""
        }
        
        for index in keyInputs.indices {
            let item = keyInputs[index]
            if item == -2 {
                answer = ""
                continue
            }
            if item == -1 && answer.count != 0 {// last?
                answer.popLast()
                continue
            }
            answer.append(String(item))
        }
        if answer.count < limit {
            return ""
        }
        return String(answer.prefix(limit))
    }
}
