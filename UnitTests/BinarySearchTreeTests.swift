//
//  BinaryTreeTests.swift
//  DataStructures
//
//  Created by Marko Hlebar on 19/04/2016.
//  Copyright © 2016 Marko Hlebar. All rights reserved.
//

import XCTest

class BinarySearchTreeTests: XCTestCase {

    var tree: BinarySearchTree<String>!
    
    override func setUp() {
        super.setUp()

        tree = BinarySearchTree<String>()
    }
    
    func testIsEmptyWhenCreated() {
        XCTAssertTrue(tree.isEmpty())
    }
    
    func testAddingOneNode() {
        tree.append("A")
    }
    
    func testAppendTwoNodes() {
        tree.append("A")
        tree.append("B")
        
        XCTAssertTrue(tree.count() == 2)
    }
}
