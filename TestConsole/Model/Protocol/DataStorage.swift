//
//  DataStorage.swift
//  TestConsole
//
//  Created by William Pompei on 14/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation

/// Data storage definition.
protocol DataStorage {
    
    /// Add a message.
    ///
    /// - Parameter item: message to add
    func addMessage(item: Message)
    
    
    /// Get all messages posted by user specified by "username" param.
    /// If specified the messages from user follwed are included too.
    ///
    /// - Parameters:
    ///   - username: username identifier
    ///   - withFollowed: include message from followed user
    /// - Returns: message list
    func messages(for username: String, withFollowed: Bool) -> [Message]
    
    /// Add a follower to a user.
    ///
    /// - Parameters:
    ///   - username: user followed
    ///   - followedBy: follower
    func addFollower(username: String, followedBy: String)
    
    /// List of followed by user specified by "username" param.
    ///
    /// - Parameter username: username dentifier
    /// - Returns: the user followed
    func followed(by username: String) -> [String]

}
