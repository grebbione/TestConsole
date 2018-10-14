//
//  CommandParserImpl.swift
//  TestConsole
//
//  Created by Pompei William - Tech Consultant on 12.10.18.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation

struct CommandParserImpl: CommandParser {
    
    func parse(text: String) -> CommandType {
        let components = text.components(separatedBy: " ")
        let value = command(from: components)
        return value
    }
    
    private func parseReader(by username: String, components: [String]) -> CommandType? {
        guard components.indices.contains(1) == false else { return nil }
        return .reader(username: username)
    }
    
    private func parsePost(by username: String, components: [String]) -> CommandType? {
        guard components.indices.contains(1)
            && components.indices.contains(2) else { return nil }
        let command = components[1]
        let message = components[2...].joined(separator: " ")
        guard  command == "->" else { return nil }
        return .post(message: message, by: username)
    }
    
    private func parseFollow(by username: String, components: [String]) -> CommandType? {
        guard components.indices.contains(1)
            && components.indices.contains(2) else { return nil }
        let command = components[1]
        let followed = components[2]
        guard  command == "follows" else { return nil }
        return .follows(username: followed, by: username)
    }
    
    private func parseWall(by username: String, components: [String]) -> CommandType? {
        guard components.indices.contains(1) else { return nil }
        let command = components[1]
        guard  command == "wall" else { return nil }
        return .wall(username: username)
    }
    
    private func getUser(from components: [String]) -> String? {
        guard let userName = components.first else { return nil}
        return userName
    }
    
    private func command(from components: [String]) -> CommandType {
        guard let username = getUser(from: components) else { return .info }
        let parsers: [(String, [String]) -> CommandType?] = [ parseReader, parsePost, parseFollow, parseWall]
        
        var commandValue: CommandType = .info
        for parser in parsers {
            guard let command = parser( username, components) else { continue }
            commandValue = command
        }
        
        return commandValue
    }
    
}
