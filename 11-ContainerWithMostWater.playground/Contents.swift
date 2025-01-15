import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        if height.count < 2 {
            return 0
        }
        var leftIndex = 0
        var rightIndex = height.count - 1
        var maxArea = min(height[leftIndex], height[rightIndex]) * rightIndex - leftIndex
        while leftIndex < rightIndex {
            if height[leftIndex] < height[rightIndex] {
                leftIndex += 1
            } else {
                rightIndex -= 1
            }
            let newArea = min(height[leftIndex], height[rightIndex]) * (rightIndex - leftIndex)
            maxArea = max(maxArea, newArea)
        }
        
        return maxArea
    }
}
