import Foundation
import Testing

extension String {
    subscript(_ index: Int) -> Character {
        self[self.index(startIndex, offsetBy: index)]
    }
}

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
        var windowLeftPointer = 0
        var windowRightPointer = 0
        var characterSet: [Character] = []
        
        while windowRightPointer < s.count {
            let character = s[windowRightPointer]
            
            if let duplicateIndex = characterSet.firstIndex(of: character) {
                characterSet.removeSubrange(0...duplicateIndex)
                windowLeftPointer += duplicateIndex + 1
            }
            characterSet.append(character)
            maxLength = max(maxLength, windowRightPointer - windowLeftPointer + 1)
            windowRightPointer += 1
        }
        
        return maxLength
    }
}

print(Solution().lengthOfLongestSubstring("abcabcbb"))
