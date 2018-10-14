//
//  TestSortedImpl.swift
//  UnitTest
//
//  Created by William Pompei on 14/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import XCTest

class TestSortedImpl: XCTestCase {

    var sorter: Sorter!
    override func setUp() {
        sorter = SorterImpl()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSorter() {
        
        let username = "pluto"
        let messageOne = "Hey joe"
        let dateOne = Date()
        let itemOne = Message(username: username, message: messageOne, date: dateOne)
        
        let messageTwo = "Hey joe"
        let dateTwo = Date()
        let itemTwo = Message(username: username, message: messageTwo, date: dateTwo)
        
        let sorted = sorter.sort(items: [ itemOne, itemTwo])
        XCTAssertEqual(sorted, [itemTwo, itemOne])
    }


}
