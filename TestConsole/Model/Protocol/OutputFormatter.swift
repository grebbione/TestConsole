//
//  OutputFormatter.swift
//  TestConsole
//
//  Created by William Pompei on 13/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation


/// Format the command execution result into
/// a list of String ready to be shown to the user.
protocol OutputFormatter {
    func format(result: Result) -> [String]
}
