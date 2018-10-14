//
//  TestsOutputFormatter.swift
//  UnitTest
//
//  Created by William Pompei on 14/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import XCTest

class TestsOutputFormatter: XCTestCase {
    
    var outputFormatter: OutputFormatter!
    var dateDifferenceFormatter: DateDifferenceFormatterMock!
    override func setUp() {
        dateDifferenceFormatter = DateDifferenceFormatterMock(returnValue: " ( a date )")
        outputFormatter = OutputFormatterImpl(dateDifferenceFormatter: dateDifferenceFormatter)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testItemFormatter() {
        let username = "pluto"
        let messageOne = "Hey joe"
        let dateOne = Date()
        let itemOne = Message(username: username, message: messageOne, date: dateOne)
        
        let result: Result = .reader(content: [itemOne])
        let output = outputFormatter.format(result: result)
        XCTAssertEqual(output, ["pluto - Hey joe ( a date )"])
    }
    
    func testInfoFormatter() {
        let result: Result = .info
        let output = outputFormatter.format(result: result)
        XCTAssertEqual(output, ["Please read usage instruction"])
    }
    
}
