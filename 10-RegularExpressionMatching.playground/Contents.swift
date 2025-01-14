import Foundation

extension String {
    func charAt(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
    func substring(_ from: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: from)..<self.endIndex])
    }
}

class Solution {
    let regexChars = [".", "*"]
    func isMatch(_ s: String, _ p: String) -> Bool {
        if (p.isEmpty) {
            return s.isEmpty
        }
        let first_match = (!s.isEmpty && (p.charAt(0) == s.charAt(0) || p.charAt(0) == "."))

        if (p.count >= 2 && p.charAt(1) == "*") {
            return (
                isMatch(s, p.substring(2)) ||
                (first_match && isMatch(s.substring(1), p))
            );
        } else {
            return (
                first_match && isMatch(s.substring(1), p.substring(1))
            );
        }
    }
}
