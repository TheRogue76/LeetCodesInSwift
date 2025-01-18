import Foundation

extension String {
    subscript(i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
}

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var prefix = ""
        let minLength = strs.min(by: { $0.count < $1.count })?.count ?? 0
        guard minLength > 0 else {
            return prefix
        }
        for i in 0..<minLength {
            let currentChar = strs[0][i]
            for str in strs[1...] {
                guard str[i] == currentChar else {
                    return prefix
                }
            }
            prefix.append(currentChar)
        }
        
        return prefix
    }
}
