//
//  TestExecutorImpl.swift
//  UnitTest
//
//  Created by William Pompei on 14/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import XCTest

class TestExecutorImpl: XCTestCase {

    var executor: Executor!
    override func setUp() {
        let storage = DataStorageImpl(storage: [Message](), follow: [String: [String]]())
        let sorter = SorterImpl()
        executor = ExecutorImpl(storage: storage, sorter: sorter)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPost() {
        let command = CommandType.post(message: "message", by: "user")
        let result = executor.perform(command: command)
        XCTAssertEqual(result, Result.post(message: "message", username: "user"))
    }

    func testFollows() {
        let command = CommandType.follows(username: "followed", by: "follower")
        let result = executor.perform(command: command)
        XCTAssertEqual(result, Result.follows(username: "followed", by: "follower"))
    }

    func testWall() {
        let command = CommandType.wall(username: "followed")
        let result = executor.perform(command: command)
        XCTAssertEqual(result, Result.wall(content: []))
    }

    func testReader() {
        let command = CommandType.reader(username: "followed")
        let result = executor.perform(command: command)
        XCTAssertEqual(result, Result.reader(content: []))
    }

    func testInfo() {
        let command = CommandType.info
        let result = executor.perform(command: command)
        XCTAssertEqual(result, Result.info)
    }

}
