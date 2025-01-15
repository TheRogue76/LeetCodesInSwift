import Foundation

class Solution {
    enum RomanNumeral: Int, CaseIterable {
        case M = 1000
        case CM = 900
        case D = 500
        case CD = 400
        case C = 100
        case XC = 90
        case L = 50
        case XL = 40
        case X = 10
        case IX = 9
        case V = 5
        case IV = 4
        case I = 1
        
        var roman: String {
            switch self {
            case .M: return "M"
            case .CM: return "CM"
            case .D: return "D"
            case .CD: return "CD"
            case .C: return "C"
            case .XC: return "XC"
            case .L: return "L"
            case .XL: return "XL"
            case .X: return "X"
            case .IX: return "IX"
            case .V: return "V"
            case .IV: return "IV"
            case .I: return "I"
            }
        }
    }
    func intToRoman(_ num: Int) -> String {
        guard num > 0 else {
            return ""
        }
        var startValue = num
        var result = ""
        for romanNumeral in RomanNumeral.allCases {
            if startValue >= romanNumeral.rawValue {
                result += String(repeating: romanNumeral.roman, count: startValue / romanNumeral.rawValue)
                startValue %= romanNumeral.rawValue
            }
        }
        return result
    }
}
