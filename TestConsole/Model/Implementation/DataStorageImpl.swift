//
//  DataStorage.swift
//  TestConsole
//
//  Created by Pompei William - Tech Consultant on 12.10.18.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation

struct Message: Equatable {
    let username: String
    let message: String
    let date: Date
}

class DataStorageImpl: DataStorage {
    
    private( set) var storage: [Message]
    private( set) var follow: [String: [String]]

    init( storage: [Message], follow: [String: [String]]){
        self.storage = storage
        self.follow = follow
    }
    
    func addMessage(item: Message) {
        storage.append(item)
    }
    
    func messages(for username: String, withFollowed: Bool) -> [Message] {
            var items = messages(filteredBy: username)
            
            if withFollowed {
                follow[ username]?.forEach{ followed in
                    items.append(contentsOf: messages(for: followed, withFollowed: false))
                }
            }
            return items
        }
    
    func addFollower(username: String, followedBy: String) {
        follow[followedBy] == nil ? follow[followedBy] = [username] : follow[followedBy]?.append(username)
    }
    
    func followed(by username: String) -> [String] {
        guard let followedBy = follow[username] else {
            return []
        }
        return followedBy
    }
}

private extension DataStorageImpl {
    private func messages(filteredBy username: String) -> [Message] {
        let messages = storage.filter { item in
            item.username == username
        }
        return messages
    }

}


