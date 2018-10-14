//
//  TestDataStorageImpl.swift
//  UnitTest
//
//  Created by William Pompei on 14/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import XCTest

class TestDataStorageImpl: XCTestCase {
    
    var dataStorage: DataStorage!
    
    override func setUp() {
        let storage = [Message]()
        let follow = [String: [String]]()
        dataStorage = DataStorageImpl(storage: storage, follow: follow)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /*
     func addMessage(item: Item)
     func messages(for username: String, withFollower: Bool) -> [Item]
     func addFollower(username: String, followedBy: String)
     func followed(by username: String) -> [String]
     
     
     */
    func testDataStorageAddMessage() {
        let username = "pluto"
        let messageOne = "Hey joe"
        let dateOne = Date()
        let itemOne = Message(username: username, message: messageOne, date: dateOne)
        dataStorage.addMessage(item: itemOne)
        
        let messageTwo = "Hey joe"
        let dateTwo = Date()
        let itemTwo = Message(username: username, message: messageTwo, date: dateTwo)
        dataStorage.addMessage(item: itemTwo)
        
        let values = dataStorage.messages(for: username, withFollowed: false)
        XCTAssertEqual(values, [itemOne, itemTwo])
    }
    
    func testAddFollower(){
        let usernameOne = "pluto"
        let messageOne = "Hey joe"
        let dateOne = Date()
        let itemOne = Message(username: usernameOne, message: messageOne, date: dateOne)
        dataStorage.addMessage(item: itemOne)
        
        let usernameTwo = "pippo"
        let messageTwo = "yo bro"
        let dateTwo = Date()
        let itemTwo = Message(username: usernameTwo, message: messageTwo, date: dateTwo)
        dataStorage.addMessage(item: itemTwo)
        
        dataStorage.addFollower(username: usernameTwo, followedBy: usernameOne)
        XCTAssertEqual(dataStorage.followed(by: usernameOne), [ usernameTwo])
    }
    
    func testEmpyFollowedList(){
        XCTAssertEqual(dataStorage.followed(by: "pippo"), [])
    }
    
    func testMessagesWithFollowing(){
        let usernameOne = "pluto"
        let messageOne = "Hey joe"
        let dateOne = Date()
        let itemOne = Message(username: usernameOne, message: messageOne, date: dateOne)
        dataStorage.addMessage(item: itemOne)
        
        let usernameTwo = "pippo"
        let messageTwo = "yo bro"
        let dateTwo = Date()
        let itemTwo = Message(username: usernameTwo, message: messageTwo, date: dateTwo)
        dataStorage.addMessage(item: itemTwo)
        dataStorage.addFollower(username: usernameTwo, followedBy: usernameOne)
        let messages = dataStorage.messages(for: usernameOne, withFollowed: true)
        XCTAssertEqual(messages, [itemOne, itemTwo])
    }
}
