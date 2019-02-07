//
//  DateUtilsTests.swift
//  RSS-News-Tests
//
//  Created by Alexander Tereshkov on 2/7/19.
//  Copyright © 2019 AT. All rights reserved.
//

import XCTest

class TimeAgoProviderTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testHourAgoProvider() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let hourAgo = Calendar.current.date(byAdding: .hour, value: -1, to: Date())!
        let provider = TimeAgoProvider(date: hourAgo, fullTimeFormatter: formatter)
        let hourAgoComputed = provider.timeAgo()
        let hourAgoResult = L10n.Time.hrAgo(1)
        XCTAssertEqual(hourAgoComputed, hourAgoResult, "Hour ago is incorrect")
    }
    
    func testDayAgoProvider() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let dayAgo = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let provider = TimeAgoProvider(date: dayAgo, fullTimeFormatter: formatter)
        let dayAgoComputed = provider.timeAgo()
        let dayAgoResult = L10n.Time.dayAgo(1)
        XCTAssertEqual(dayAgoComputed, dayAgoResult, "Day ago is incorrect")
    }
    
    func testMonthAgoProvider() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let monthAgo = Calendar.current.date(byAdding: .month, value: -1, to: Date())!
        let provider = TimeAgoProvider(date: monthAgo, fullTimeFormatter: formatter)
        let monthAgoComputed = provider.timeAgo()
        let monthAgoResult = formatter.string(from: monthAgo)
        XCTAssertEqual(monthAgoComputed, monthAgoResult, "Month ago is incorrect")
    }
    
}
