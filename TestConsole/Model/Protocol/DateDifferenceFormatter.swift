//
//  DateDifferenceFormatter.swift
//  TestConsole
//
//  Created by William Pompei on 13/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation

/// Date difference computation and formatting
protocol DateDifferenceFormatter {
    
    /// Compute the difference for
    /// two dates and format the result
    /// into a String ready to be shown
    /// to user.
    ///
    /// The difference computed is "to date" - "from date".
    /// - Parameters:
    ///   - from: start date
    ///   - to: end date
    /// - Returns: String formatted date difference
    func formatDifference(from: Date, to: Date) -> String
}
