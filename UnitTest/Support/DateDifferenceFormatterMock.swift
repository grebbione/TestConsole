//
//  DateDistanceMock.swift
//  UnitTest
//
//  Created by William Pompei on 14/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import Foundation


struct DateDifferenceFormatterMock: DateDifferenceFormatter {
    
    let returnValue: String
    
    func formatDifference(from: Date, to: Date) -> String {
        return returnValue
    }
}
