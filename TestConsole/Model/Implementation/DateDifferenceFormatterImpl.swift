//
//  DateDiffernceFormatterImpl.swift
//  TestConsole
//
//  Created by William Pompei on 13/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation

struct DateDifferenceFormatterImpl: DateDifferenceFormatter {
    func formatDifference(from: Date, to: Date) -> String {
        let difference = Calendar.current.dateComponents([.second], from: from, to: to)
        guard let seconds = difference.second else { return "" }
        
        let valueToPrint: Int
        let measure: String
        if seconds <= 59{
            valueToPrint = seconds
            measure = valueToPrint < 2 ? "second" : "seconds"
        } else {
            valueToPrint = seconds / 60
            measure = valueToPrint < 2 ? "minute" : "minutes"
        }
    
        return " (\(valueToPrint) \(measure) ago)"
    }
}
