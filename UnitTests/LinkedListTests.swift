//
//  LinkedListTests.swift
//  DataStructures
//
//  Created by Marko Hlebar on 16/04/2016.
//  Copyright © 2016 Marko Hlebar. All rights reserved.
//

import XCTest

class LinkedListTests: XCTestCase {
    
    var list: LinkedList<String>!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        list = LinkedList<String>()
    }
    
    func testIsEmptyWhenCreated() {
        XCTAssert(list.isEmpty())
        XCTAssert(list.count() == 0)
    }
    
    func testIsNotEmptyWhenCreatedFromAnotherLinkedlist() {
        let list2 = LinkedList<String>()
        list2.append("A")
        
        list = LinkedList(list: list2)
        XCTAssert(list.count() == 1)
    }
    
    func testAddingOneString() {
        list.append("A")
        
        XCTAssert(list.count() == 1)
    }
    
    func testAddingTwoStrings() {
        list.append("A")
        list.append("B")
        
        XCTAssert(list.count() == 2)
    }
    
    func testAdding100Strings() {
        for index in 0..<100 {
            list.append("\(index)")
        }
        
        XCTAssert(list.count() == 100)
    }
    
    func testFind() {
        list.append("A")
        list.append("B")
        list.append("C")
        
        XCTAssert(list.find("B")?.data == "B")
    }
    
    func testRemoveOneString() {
        list.append("A")
        list.remove("A")
        
        XCTAssert(list.isEmpty())
        XCTAssert(list.count() == 0)
    }
    
    func testRemoveTwoStrings() {
        list.append("A")
        list.append("B")

        list.remove("A")
        list.remove("B")
        
        XCTAssert(list.isEmpty())
        XCTAssert(list.count() == 0)
    }
    
    func testRemoveHead() {
        list.append("A")
        list.append("B")
        list.remove("A")
        
        XCTAssert(list.count() == 1)
        XCTAssertNil(list.find("A"))
    }
    
    func xtestAddRemoveDuplicates() {
        list.append("A")
        list.append("B")
        list.append("B")
        list.append("C")
        list.remove("B")
        
        XCTAssert(list.count() == 2)
    }
    
    func testObjectAtIndexReturnsNilOnIndexOutOfBounds() {
        XCTAssertNil(list.objectAtIndex(0))
    }
    
    func testObjectAtIndexOneObject() {
        list.append("A")
        XCTAssert(list.objectAtIndex(0) == "A")
    }
    
    func testObjectAtIndexMultipleObjects() {
        list.append("A")
        list.append("B")
        list.append("C")
        list.append("D")
        XCTAssert(list.objectAtIndex(2) == "C")
    }
    
    func testForLoop() {
        list.append("A")
        list.append("B")
        
        var array = [String]()
        for string in list {
            array.append(string)
        }
        
        XCTAssert(array[0] == "A")
        XCTAssert(array[1] == "B")
    }
    
    func testReverse() {
        list.append("A")
        list.append("B")
        list.append("C")

        let reversed = list.reverse()
        
        XCTAssert(reversed[0] == "C")
        XCTAssert(reversed[1] == "B")
        XCTAssert(reversed[2] == "A")
    }
}
