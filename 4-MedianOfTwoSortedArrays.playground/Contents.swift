import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let mergedArrayCount = nums1.count + nums2.count
        var arr1Index = 0, arr2Index = 0
        if !mergedArrayCount.isMultiple(of: 2) {
            var counter = 0
            var medianValue: Int?
            while counter < (mergedArrayCount / 2) + 1 {
                if nums1[arr1Index] < nums2[arr2Index] {
                    medianValue = nums1[arr1Index]
                    arr1Index += 1
                } else {
                    medianValue = nums2[arr2Index]
                    arr2Index += 1
                }
                counter += 1
            }
            return Double(medianValue!)
        } else {
            var counter = 0
            var medianLow: Int?
            var medianHigh: Int?
            while counter < (mergedArrayCount / 2) + 1 {
                if nums1[arr1Index] < nums2[arr2Index] {
                    medianLow = medianHigh
                    medianHigh = nums1[arr1Index]
                    arr1Index += 1
                } else {
                    medianLow = medianHigh
                    medianHigh = nums2[arr2Index]
                    arr2Index += 1
                }
                counter += 1
            }
            return Double((medianLow! + medianHigh!)) / 2
        }
    }
}

print(Solution().findMedianSortedArrays([1,3], [2]))
