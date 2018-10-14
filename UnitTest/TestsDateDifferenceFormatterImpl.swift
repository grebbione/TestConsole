//
//  TestsDateDifferenceFormatterImpl.swift
//  UnitTest
//
//  Created by William Pompei on 14/10/2018.
//  Copyright © 2018 William Pompei. All rights reserved.
//

import XCTest

class TestsDateDifferenceFormatterImpl: XCTestCase {

    var dateDifferenceFormatter: DateDifferenceFormatterImpl!
    override func setUp() {
        dateDifferenceFormatter = DateDifferenceFormatterImpl()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDateDifferenceFormatOneMinute() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        let dateOne = formatter.date(from: "14/10/2018 20:57")!
        let dateTwo = formatter.date(from: "14/10/2018 20:58")!
        
        let result = dateDifferenceFormatter.formatDifference(from: dateOne, to: dateTwo)
        XCTAssertEqual(result," (1 minute ago)")
    }

    func testDateDifferenceFormatMoreMinutes() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        let dateOne = formatter.date(from: "14/10/2018 20:57")!
        let dateTwo = formatter.date(from: "14/10/2018 20:59")!
        
        let result = dateDifferenceFormatter.formatDifference(from: dateOne, to: dateTwo)
        XCTAssertEqual(result," (2 minutes ago)")
    }

    func testDateDifferenceFormatOneSecond() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        let dateOne = formatter.date(from: "14/10/2018 20:57:00")!
        let dateTwo = formatter.date(from: "14/10/2018 20:57:01")!
        
        let result = dateDifferenceFormatter.formatDifference(from: dateOne, to: dateTwo)
        XCTAssertEqual(result," (1 second ago)")
    }
    
    func testDateDifferenceFormatMoreSeconds() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        let dateOne = formatter.date(from: "14/10/2018 20:57:00")!
        let dateTwo = formatter.date(from: "14/10/2018 20:57:09")!
        
        let result = dateDifferenceFormatter.formatDifference(from: dateOne, to: dateTwo)
        XCTAssertEqual(result," (9 seconds ago)")
    }
}
