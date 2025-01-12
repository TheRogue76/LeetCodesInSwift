import Foundation

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows != 1 else { return s }
        let goldenNumber = (numRows - 1) * 2
        var rows: [[Character]] = Array(repeating: [], count: numRows)
        for (index, character) in s.enumerated() {
            var modIndex = index % goldenNumber
            if modIndex >= numRows {
                rows[goldenNumber - modIndex].append(character)
            } else {
                rows[modIndex].append(character)
            }
        }
        let strings = Array(rows.map { String($0) })
        return strings.joined()
    }
}

print(Solution().convert("PAYPALISHIRING", 4))
