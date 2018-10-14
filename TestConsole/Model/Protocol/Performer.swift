//
//  Perform.swift
//  TestConsole
//
//  Created by William Pompei on 14/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation

/// Perform a command
protocol Performer {
    /// Perform the command defined by the
    /// parameter and produce a multiline result
    /// ready to be shown to the user.
    ///
    /// - Parameter command: string containing the command to be performed
    /// - Returns: command result resy to be shown to user.
    func perform(command: String) -> [String]
}
