//
//  RadixTreeTests.swift
//  DataStructures
//
//  Created by Marko Hlebar on 06/05/2016.
//  Copyright © 2016 Marko Hlebar. All rights reserved.
//

import XCTest

class RadixTreeTests: XCTestCase {
    
    var tree: RadixTree!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        tree = RadixTree()
    }
    
    func testAddingOneString() {
        tree.append("A")
        
        XCTAssertNotNil(tree.find("A"))
    }
    
}
