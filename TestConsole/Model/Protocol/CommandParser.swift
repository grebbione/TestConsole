//
//  CommandParser.swift
//  TestConsole
//
//  Created by Pompei William - Tech Consultant on 12.10.18.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation


/// Command type
///
/// - post: post a message
/// - follows: follow another user
/// - wall: user wall
/// - reader: user messages
/// - info: usage instructions when user insert a wrong command
enum CommandType: Equatable {
    case post(message: String, by: String)
    case follows(username: String, by: String)
    case wall(username: String)
    case reader(username: String)
    case info
}

/// Parse command from user inserted string
protocol CommandParser {
    func parse(text: String) -> CommandType
}
