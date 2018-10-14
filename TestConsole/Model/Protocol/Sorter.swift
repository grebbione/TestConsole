//
//  Sorter.swift
//  TestConsole
//
//  Created by William Pompei on 13/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation


/// Sorter used to sort messages order,
/// which can be different for the posting order.
protocol Sorter {
    func sort(items: [Message]) -> [Message]
}
