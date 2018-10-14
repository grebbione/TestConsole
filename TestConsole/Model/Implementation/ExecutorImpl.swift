//
//  ExecutorImpl.swift
//  TestConsole
//
//  Created by Pompei William - Tech Consultant on 12.10.18.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation


struct ExecutorImpl: Executor {
    
    let storage: DataStorage
    let sorter: Sorter
    
    func perform(command: CommandType) -> Result {
        let result: Result
        switch command {
        case let .post( message, username):
            let item = Message(username: username, message: message, date: Date())
            storage.addMessage(item: item)
            result = .post(message: message, username: username)
        case let .follows(username, by):
            storage.addFollower(username: username, followedBy: by)
            result = .follows(username: username, by: by)
        case let .wall(username):
            let wall = storage.messages(for: username, withFollowed: true)
            let sortedMessages = sorter.sort(items: wall)
            result = .wall(content: sortedMessages)
        case .info:
            result = .info
        case .reader(let username):
            let personalMessages = storage.messages(for: username, withFollowed: false)
            let sortedMessages = sorter.sort(items: personalMessages)
            result = .reader(content: sortedMessages)
        }
        return result
    }
    
}
