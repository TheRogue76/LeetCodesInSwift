import Foundation
import Testing


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let rootNode: ListNode? = ListNode()
        var curNode = rootNode
        var carry = 0
        
        var leftNode = l1
        var rightNode = l2
        
        while leftNode != nil || rightNode != nil {
            let val1 = leftNode?.val ?? 0
            let val2 = rightNode?.val ?? 0
            let sum = val1 + val2 + carry
            carry = sum / 10
            let value = sum % 10
            
            curNode?.val = value
            
            leftNode = leftNode?.next
            rightNode = rightNode?.next
            if leftNode != nil || rightNode != nil || carry > 0 {
                curNode?.next = ListNode()
            }
            curNode = curNode?.next
        }
        if carry > 0 {
            curNode?.val = carry
        }
        return rootNode
    }
}
