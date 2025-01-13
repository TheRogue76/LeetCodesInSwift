import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        let forcedX = Int32(x)
        let sign: Int32 = forcedX < 0 ? -1 : 1
        let absX = abs(forcedX)
        let reversedString = String(String(absX).reversed())
        guard let reversed = Int32(reversedString) else {
            return 0
        }
        return Int(sign * reversed)
    }
}

print(Solution().reverse(-123456789))
print(Solution().reverse(-120))
