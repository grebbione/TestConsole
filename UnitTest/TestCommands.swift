//
//  UnitTest.swift
//  UnitTest
//
//  Created by Pompei William - Tech Consultant on 12.10.18.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import XCTest

class UnitTest: XCTestCase {
    
    var performer: Performer!
    var storage: [Message]!
    var follow: [String: [String]]!
    
    override func setUp() {
        super.setUp()
        
        storage = [Message]()
        follow = [String: [String]]()
        
        let memoryStorage = DataStorageImpl(storage: storage, follow: follow)
        let sorter = SorterImpl()
        let executor = ExecutorImpl(storage: memoryStorage, sorter: sorter)
        
        let parser = CommandParserImpl()
        let dateDifferenceFormatter = DateDifferenceFormatterMock(returnValue: "")
        let outputFormatter = OutputFormatterImpl(dateDifferenceFormatter: dateDifferenceFormatter)
        performer = PerformerImpl(parser: parser, executor: executor, outputFormatter: outputFormatter)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPost() {
        let output = performer.perform(command: "pippo -> hey jo")
        XCTAssertEqual(output, [])
    }
    
    func testReader() {
        let _ = performer.perform(command: "pippo -> hey jo")
        let output = performer.perform(command: "pippo")
        XCTAssertEqual(output, ["pippo - hey jo"])
    }
    
    func testWall() {
        let commands = [
            "pippo -> hey jo",
            "pippo -> new record today...yahooooo"
        ]
        
        commands.forEach { command in
            let _ = performer.perform(command: command)
        }
        let output = performer.perform(command: "pippo wall")
        XCTAssertEqual(output, [
            "pippo - new record today...yahooooo",
            "pippo - hey jo"
            ])
    }
    
    func testFollows() {
        let commands = [
            "pippo follows pluto",
            "pippo -> hey jo",
            "pluto -> yo bro",
            "pluto -> new record today",
            "pippo -> gone holiday: see ya!",
            "pippo wall"
        ]
        
        let followsOutput = performer.perform(command: commands.first!)
        XCTAssertEqual(followsOutput, [])
        commands[1...(commands.count - 1)].forEach{ command in
            let _ = performer.perform(command: command)
        }
        
        let output = performer.perform(command: commands.last!)
        XCTAssertEqual(output, [
            "pippo - gone holiday: see ya!",
            "pluto - new record today",
            "pluto - yo bro",
            "pippo - hey jo"
            ]
        )
    }
}
