//
//  Performer.swift
//  TestConsole
//
//  Created by Pompei William - Tech Consultant on 12.10.18.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation

struct PerformerImpl: Performer {
    
    let parser: CommandParser
    let executor: Executor
    let outputFormatter: OutputFormatter
    
    func perform(command: String) -> [String] {
        let command = parser.parse(text: command)
        let result = executor.perform(command: command)
        let value = outputFormatter.format(result: result)
        return value
    }
    
    static func performerFactory() -> PerformerImpl {
        let memoryStorage = DataStorageImpl(storage: [Message](), follow: [String: [String]]())
        let sorter = SorterImpl()
        let executor = ExecutorImpl(storage: memoryStorage, sorter: sorter)
        
        let parser = CommandParserImpl()
        let dateDifferenceFormatter = DateDifferenceFormatterImpl()
        let outputFormatter = OutputFormatterImpl(dateDifferenceFormatter: dateDifferenceFormatter)
        let performer = PerformerImpl(parser: parser, executor: executor, outputFormatter: outputFormatter)
        return performer
    }
}

