//
//  CCILinkedListsTests.swift
//  Interview
//
//  Created by Shawn Webster on 21/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import XCTest

class CCILinkedListsTests: XCTestCase {
    
    let ll = CCILinkedLists()
    let l = LinkedList()
    
    /*
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    */
    
    func testNode() {
        let n = Node()
        let m = Node()
        
        n.data = Int(1)
        n.next = m
        m.data = Int(2)
        
        XCTAssertEqual(n.data as! Int, Int(1))
        XCTAssertEqual(m.data as! Int, Int(2))
        XCTAssertEqual(n.next, m)
        XCTAssertNil(m.next)
        
    }
    
    func testLinkedList() {
        

        let a = "a"
        let b = "b"
        let c = "c"
        let d = "d"
        let e = "e"
        
        XCTAssertNil(l.head, "an empty list should not have a head")
        XCTAssertNil(l.tail, "an empty list should not have a tail")
        
        //add one item
        l.append(a)
        XCTAssertNotNil(l.head, "after appending one item, the list should now have a head")
        XCTAssertNotNil(l.tail, "after appending one item, the list should now have a tail")
        XCTAssertEqual(l.head, l.tail!, "the head should also be the tail of a list with 1 item")
        XCTAssertEqual(l.head.data as! String, a, "the data of the appended item should be the value that was appended")

        //add another item
        l.append(b)
        XCTAssertNotEqual(l.head, l.tail!, "for a list with two items, the head should not equal the tail")
        
        //add some more
        l.append(c)
        l.append(d)
        l.append(e)
        
        //remove the head, it shouldn't be in the list
        l.removeNode(l.head)
        XCTAssertNotEqual(a, l.head.data as! String, "after removing the head of a list, the removed item's data should not be the data at the head of the list")
        
        //remove the tail, it shouldn't be in the list
        l.removeNode(l.tail)
        XCTAssertNotEqual(e, l.tail?.data as! String, "after removing the tail of a list, the removed item's data hsould not be the data at the tail of the list")
        
        //remove the middle node
        let middleNode = l.head.next
        XCTAssertNotEqual(l.head, middleNode, "in a list of more than 2 items, the node next to head should not be the head of the list")
        XCTAssertNotEqual(l.tail!, middleNode, "in a list of more than 2 items, the node next to head should not be the tail of the list")
        XCTAssertEqual(middleNode.next, l.tail!, "in a list of 3 items, the node next to head should have the tail as its next node")
        l.removeNode(middleNode)
        XCTAssertEqual(l.head.next, l.tail!)
    }
    
    
    func test_2_1() {
        let list = LinkedList()
        
        for i in 1...10 {
            list.append(Int(i%5))
        }

        XCTAssertEqual(list.length, 10)
        ll.removeDupes(list)
        XCTAssertEqual(list.length, 5)
    }
    
    func test_2_2() {

        l.append(3)
        l.append(2)
        l.append(1)
        l.append(0)
        
        //off the end
        let k4 = ll.kthLastElement(4, inList:l)
        XCTAssertNil(k4, "a list with fewer elements than k should return nil")
        
        //kth last is head
        let k3 = ll.kthLastElement(3, inList:l)
        XCTAssertEqual(k3.data as! Int, l.head.data as! Int, "the kth last element in a list of size k should be its head")

        let k1 = ll.kthLastElement(1, inList:l)
        XCTAssertEqual(k1.next, l.tail!, "the next to last element should point to the tail")
        
        let k0 = ll.kthLastElement(0, inList:l)
        XCTAssertEqual(k0.data as! Int, l.tail?.data as! Int, "the 0th to last element should be the lists tail")
        
        
    }
    
    func test_2_3() {
        
        let a = "a"
        let b = "b"
        let c = "c"
        let d = "d"
        l.append(a)
        l.append(b)
        l.append(c)
        l.append(d)
        
        //remember that h will stay the same, its the data that changes
        let h = l.head
        let hn = h.next
        let hnv = hn.data
        ll.forwardRemove(h)

        //test removing head
        XCTAssertNotEqual(h.data as! String, a, "the value of the node to remove, should no longer be the head")
        XCTAssertEqual(h.data as! String, hnv as! String, "the value next to head should be at head once removing the value previous stored at head")
        
        //test removing an intermediate node
        
        //test removing tail? this can't really be done effectively
        

    }
    
    //needs to be tested; I don't like how it messes up the relative ordering of the items
    func test_2_4() {
        l.append(4)
        l.append(1)
        l.append(2)
        l.append(8)
        l.append(6)
        l.append(5)
        l.append(2)
        l.append(3)
        l.append(4)
        l.append(1)
        l.append(2)
        l.append(8)
        
        ll.partitionList(l, aroundValue: 27)
    }
    
    
    func test_2_5() {
        
        //nothing
        var l1 = LinkedList()
        var l2 = LinkedList()
        
        XCTAssertEqual(ll.sumOfList(l1, andList: l2), 0, "nothing + nothing = 0")
        
        //one value
        l1 = LinkedList()
        l2 = LinkedList()
        
        l1.append(1)
        
        XCTAssertEqual(ll.sumOfList(l1, andList: l2), l1.head.data as! NSInteger, "something + nothing = something")
        
        //Symmetric numbers
        l1 = LinkedList()
        l2 = LinkedList()
        
        l1.append(5)
        l1.append(8)
        l1.append(9)
        //represented 985
        
        l2.append(7)
        l2.append(7)
        l2.append(7)
        
        XCTAssertEqual(ll.sumOfList(l1, andList: l2), 1762, "777 + 985 = 1762")
        
        //Assymetric numbers
        l1 = LinkedList()
        l2 = LinkedList()
        
        l1.append(5)
        l1.append(8)
        //represented 85
        
        l2.append(5)
        XCTAssertEqual(ll.sumOfList(l1, andList: l2), 90, "85 + 5 = 90")
        
    }
    
    //todo: test_2_6
    
    
    
    func test_2_7() {
        
        //7 (odd) elements; not a palindrome
        l.append(1)
        l.append(1)
        l.append(1)
        l.append(1)
        l.append(1)
        l.append(1)
        l.append(2)
        XCTAssertFalse(ll.isPalindrome(l), "1 1 1 1 1 1 2 is not a palindrome")
        
        //6 (even) elements; a palindrome
        l.removeNode(l.tail)
        XCTAssertTrue(ll.isPalindrome(l), "1 1 1 1 1 1 is a palindrome")
        
        //6 (even) elements; not a palindrome
        l.removeNode(l.head)
        l.append(2)
        XCTAssertFalse(ll.isPalindrome(l), "1 1 1 1 1 2 is not palindrome")
        
        //5 (odd) elements; is a palindrome
        l.removeNode(l.head)
        l.removeNode(l.head)
        l.prepend(2)
        XCTAssertTrue(ll.isPalindrome(l), "2 1 1 1 2 is a palindrome")
        
        l.removeNode(l.head)
        l.removeNode(l.head)
        XCTAssertFalse(ll.isPalindrome(l), "1 1 2 is not a palindrome")
        
        l.removeNode(l.head)
        l.prepend(2)
        XCTAssertTrue(ll.isPalindrome(l), "2 1 2 is a palindrome")
        
        
        l.removeNode(l.head)
        XCTAssertFalse(ll.isPalindrome(l), "1 2 is not a palindrome")
        
        l.removeNode(l.head)
        l.prepend(2)
        XCTAssertTrue(ll.isPalindrome(l), "2 2 is a palindrome")
        
        l.removeNode(l.head)
        XCTAssertTrue(ll.isPalindrome(l), "2 is a palindrome")
        
        l.removeNode(l.head)
        XCTAssertTrue(ll.isPalindrome(l), "an empty list is a palindrome -- kind of")
        
    }
    
}