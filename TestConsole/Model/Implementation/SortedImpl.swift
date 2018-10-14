//
//  SortedImpl.swift
//  TestConsole
//
//  Created by William Pompei on 13/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation

struct SorterImpl: Sorter {
    func sort(items: [Message]) -> [Message] {
        let sortedItems = items.sorted{ item1, item2 in
            return item1.date > item2.date
        }
        return sortedItems
    }
}
