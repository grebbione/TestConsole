//
//  TestPerformerImpl.swift
//  UnitTest
//
//  Created by William Pompei on 14/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import XCTest

class TestPerformerImpl: XCTestCase {

    var performer: Performer!
    override func setUp() {
        
        let parser = CommandParserImpl()
        
        let dataStorage =  DataStorageImpl(storage: [Message](), follow: [String: [String]]())
        let executor = ExecutorImpl(storage: dataStorage, sorter: SorterImpl())
        
        let dateDifferenceFormatter = DateDifferenceFormatterMock(returnValue: "")
        let outputFormatter = OutputFormatterImpl(dateDifferenceFormatter: dateDifferenceFormatter)
        
        performer = PerformerImpl(parser: parser, executor: executor, outputFormatter: outputFormatter)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerform() {
        let _ = performer.perform(command: "pippo -> hey jo")
        let result = performer.perform(command: "pippo wall")
        XCTAssertEqual(result, ["pippo - hey jo"])
    }


}
