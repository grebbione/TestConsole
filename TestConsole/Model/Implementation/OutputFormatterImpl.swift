//
//  OutputFormatterImpl.swift
//  TestConsole
//
//  Created by William Pompei on 13/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation

struct OutputFormatterImpl: OutputFormatter {
    
    let dateDifferenceFormatter: DateDifferenceFormatter
    func format(result: Result) -> [String] {
        
        var value = [String]()
        switch result {
        case .post:
            value = []
        case .follows:
            value = []
        case let .wall(items), let .reader(items):
            let now = Date()
            items.forEach { item in
                let dateFormat = dateDifferenceFormatter.formatDifference(from: item.date, to: now)
                value.append("\(item.username) - \(item.message)\(dateFormat)")
            }
        case .info:
            value = ["Please read usage instruction"]
        }
        
        return value
    }
    
    
}
