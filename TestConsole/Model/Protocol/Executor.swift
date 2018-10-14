//
//  Executor.swift
//  TestConsole
//
//  Created by Pompei William - Tech Consultant on 12.10.18.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation


/// Command execution result.
/// For each CommandType definition tehr is a Result one which contains
/// the result of commands.
/// In particular for "wall" and "reader" case, the associated value contains
/// the requested messages.
///
/// Please refere to "enum CommandType" definition for specific commands details.
enum Result: Equatable {
    case post(message: String, username: String)
    case follows(username: String, by: String)
    case wall(content: [Message])
    case reader(content: [Message])
    case info
}

protocol Executor {
    func perform(command: CommandType) -> Result
}
