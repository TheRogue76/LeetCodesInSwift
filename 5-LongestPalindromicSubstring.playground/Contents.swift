import Foundation

class Solution {
    // Store input string as array.
    private var array: [Character]!

    // Store biggest palindrome info.
    private var maxSize = 0
    private var bestStart = 0
    private var bestFinish = 0

    func longestPalindrome(_ s: String) -> String {
        array = Array(s) // Make an aray out of the input string.
        guard array.count > 1 else { return s } // Check edge case.
        
        // Let's start from the middle of the string,
        //   since it's the best place for a big palindrome.
        let middle = Int(array.count / 2)
        
        // And continue to search in two directions: to the left and right side:
        //                           start
        //                  <-L        |          R->
        // "dfjhasdliudfhnasudkhcfaiehncfnusejagxfkuyseagjfuygaefgvaskuyfc"
        var lStart = middle
        var rStart = middle + 1
        
        // Check if we should continue our search.
        while worthCheck(from: lStart) {
            check(lStart)  // Check left direction.
            lStart -= 1    // Make a step to the left.
            check(rStart)  // Check right direcion.
            rStart += 1    // Make step to the right.
        }
        return String(array[bestStart...bestFinish]) // Output the result.
    }

    /// Is it possible to find a bigger palindrome in the array starting from `index` point?
    private func worthCheck(from index: Int) -> Bool {
        guard 0 <= index else { return false } // out of array
        
        // If we 2 chars from the string edge then max palindrom
        //   we can found is size 5
        //   but if we already have found palindrome with size 7
        //   then it's not worth to spend time on this search any more.
        
        // char count from start of the string
        let charCount = index + 1
        let maxPotentialSizeOfPalindrome = charCount * 2 + 1
        // check if there space for big enough palindrome.
        return maxPotentialSizeOfPalindrome > maxSize
    }

    private func check(_ startIndex: Int) {
        // let's search odd and even palindromes
        check(startIndex, odd: false) // like "abba"
        check(startIndex, odd: true)  // like "aba"
    }

    private func check(_ startIndex: Int, odd: Bool) {
        // Search progression example
        //   s - start point
        //   l - left index, start of potential palindrome
        //   r - right index, end of potential palindrome
        
        // odd  fcbaBadca      even  adSBAABSfd
        //         lsr                   sr
        //        l-s-r                 ls-r
        //       l--s--r               l-s--r

        var offset = 1
        let oddity = (odd ? 0 : 1) // Shift `lhs` index one step to the left to find `even` palindrome.
        repeat {
            // Calc left and right indexes.
            let lhs = startIndex - offset + oddity
            let rhs = startIndex + offset
            
            guard 0 <= lhs, rhs < array.count,   // Check if we are still in the array.
                  array[lhs] == array[rhs]       // Check if side chars are equal.
            else { break }                       // If this is not a palindrome then break the search.
            
            // Let's check if we've found a biggest palindrome then before and store it.
            let lenght = rhs - lhs
            if lenght > maxSize {
                maxSize = lenght
                bestStart = lhs
                bestFinish = rhs
            }
            // Increase offset for left and right index and repeat.
            offset += 1
        } while true
    }
}

print(Solution().longestPalindrome("abcba"))
