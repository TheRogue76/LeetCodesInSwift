import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        Int(String(String(x).reversed())) == x
    }
}
