import Foundation

class Solution {
    func customCharMapper(_ char: Character) -> Int32? {
        switch char {
            case "0": return 0
            case "1": return 1
            case "2": return 2
            case "3": return 3
            case "4": return 4
            case "5": return 5
            case "6": return 6
            case "7": return 7
            case "8": return 8
            case "9": return 9
            default: return nil
        }
    }
    
    static let cappedMaxInt = Int(Int32.max)
    static let cappedMinInt = Int(Int32.min)
    
    func myAtoi(_ s: String) -> Int {
        var nonWhiteSpacedS = s.trimmingCharacters(in: .whitespacesAndNewlines)
        let sign: Int32
        var result: Int32 = 0
        if nonWhiteSpacedS.first == "-" {
            sign = -1
            nonWhiteSpacedS = String(nonWhiteSpacedS.dropFirst())
        } else if nonWhiteSpacedS.first == "+" {
            sign = 1
            nonWhiteSpacedS = String(nonWhiteSpacedS.dropFirst())
        } else {
            sign = 1
        }
        for char in nonWhiteSpacedS {
            guard let val = customCharMapper(char) else {
                break
            }
            let (multiplied, multOverflow) = result.multipliedReportingOverflow(by: 10)
            guard !multOverflow else {
                return sign == -1 ? Solution.cappedMinInt : Solution.cappedMaxInt
            }
            let (appended, addOverflow) = multiplied.addingReportingOverflow(val)
            guard !addOverflow else {
                return sign == -1 ? Solution.cappedMinInt : Solution.cappedMaxInt
            }
            result = appended
        }
        let (finalVal, overflow) = result.multipliedReportingOverflow(by: sign)
        guard !overflow else {
            return sign == -1 ? Solution.cappedMinInt : Solution.cappedMaxInt
        }
        
        return Int(finalVal)
    }
}

print(Solution().myAtoi("+1"))
