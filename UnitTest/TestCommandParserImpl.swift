//
//  TestCommandParserImpl.swift
//  UnitTest
//
//  Created by William Pompei on 14/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import XCTest

class TestCommandParserImpl: XCTestCase {

    var commandParser: CommandParser!
    override func setUp() {
        commandParser = CommandParserImpl()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPost() {
        let result = commandParser.parse(text: "pippo -> hey bro")
        XCTAssertEqual(result, CommandType.post(message: "hey bro",by: "pippo"))
    }

    func testFollows() {
        let result = commandParser.parse(text: "pippo follows pluto")
        XCTAssertEqual(result, CommandType.follows(username: "pluto", by: "pippo"))
    }

    func testWall() {
        let result = commandParser.parse(text: "pippo wall")
        XCTAssertEqual(result, CommandType.wall(username: "pippo"))
    }
    
    func testReading() {
        let result = commandParser.parse(text: "pippo")
        XCTAssertEqual(result, CommandType.reader(username: "pippo"))
    }

    func testInfo() {
        let result = commandParser.parse(text: "pippo - adasdasdas")
        XCTAssertEqual(result, CommandType.info)
    }

}
