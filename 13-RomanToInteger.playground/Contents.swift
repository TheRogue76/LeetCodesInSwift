import Foundation

class Solution {
    let dictionary: [String: Int] = ["I": 1, "V":5, "X":10,"L": 50, "C": 100, "D": 500 , "M":1000]
    func romanToInt(_ s: String) -> Int {
        let items: [String] = s.map({String($0)})
        var value: Int = 0
        var sub: Int = 0
        for (index, item) in items.enumerated() {
            if index < items.count - 1 && dictionary[items[index + 1]]! > dictionary[item]! {
                sub += dictionary[item]!
            } else {
                value += dictionary[item]!
            }
        }
        return value - sub
    }
}
