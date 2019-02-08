//
//  DateUtilsTests.swift
//  RSS-News-Tests
//
//  Created by Alexander Tereshkov on 2/7/19.
//  Copyright © 2019 AT. All rights reserved.
//

import XCTest
@testable import RSS_News

class TimeAgoProviderTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    // MARK: Seconds
    
    func testSecondsNowAgoPositive() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        for index in 1..<5 {
            let dateAgo = Calendar.current.date(byAdding: .second, value: -index, to: Date())!
            let provider = TimeAgoProvider(date: dateAgo, fullTimeFormatter: formatter)
            let agoComputed = provider.timeAgo()
            let agoResult = L10n.Time.justNow
            XCTAssertEqual(agoComputed, agoResult)
        }
    }
    
    func testSecondsAgoPositive() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let dateAgo = Calendar.current.date(byAdding: .second, value: -5, to: Date())!
        let provider = TimeAgoProvider(date: dateAgo, fullTimeFormatter: formatter)
        let agoComputed = provider.timeAgo()
        let agoResult = L10n.Time.secsAgo(5)
        XCTAssertEqual(agoComputed, agoResult)
    }
    
    func testMultSecondsAgoPositive() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let dateAgo = Calendar.current.date(byAdding: .second, value: -22, to: Date())!
        let provider = TimeAgoProvider(date: dateAgo, fullTimeFormatter: formatter)
        let agoComputed = provider.timeAgo()
        let agoResult = L10n.Time.secsAgoMult(22)
        XCTAssertEqual(agoComputed, agoResult)
    }
    
    func testMinuteAgoPositive() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let dateAgo = Calendar.current.date(byAdding: .minute, value: -1, to: Date())!
        let provider = TimeAgoProvider(date: dateAgo, fullTimeFormatter: formatter)
        let minAgoComputed = provider.timeAgo()
        let minAgoResult = L10n.Time.minAgo(1)
        XCTAssertEqual(minAgoComputed, minAgoResult)
    }
    
    func testMultMinutesAgoPositive() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let dateAgo = Calendar.current.date(byAdding: .minute, value: -3, to: Date())!
        let provider = TimeAgoProvider(date: dateAgo, fullTimeFormatter: formatter)
        let agoComputed = provider.timeAgo()
        let agoResult = L10n.Time.minsAgoMult(3)
        XCTAssertEqual(agoComputed, agoResult)
    }
    
    // MARK: Hours
    
    func testHourAgoPositive() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let dateAgo = Calendar.current.date(byAdding: .hour, value: -1, to: Date())!
        let provider = TimeAgoProvider(date: dateAgo, fullTimeFormatter: formatter)
        let hourAgoComputed = provider.timeAgo()
        let hourAgoResult = L10n.Time.hrAgo(1)
        XCTAssertEqual(hourAgoComputed, hourAgoResult)
    }
    
    func testHourAgoNegative() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let dateAgo = Calendar.current.date(byAdding: .hour, value: -1, to: Date())!
        let provider = TimeAgoProvider(date: dateAgo, fullTimeFormatter: formatter)
        let hourAgoComputed = provider.timeAgo()
        let hourAgoResult = L10n.Time.hrAgo(2) // take two ours instead of one
        XCTAssertNotEqual(hourAgoComputed, hourAgoResult)
    }
    
    func testMultHoursAgoPositive() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let dateAgo = Calendar.current.date(byAdding: .hour, value: -3, to: Date())!
        let provider = TimeAgoProvider(date: dateAgo, fullTimeFormatter: formatter)
        let agoComputed = provider.timeAgo()
        let agoResult = L10n.Time.hrsAgoMult(3)
        XCTAssertEqual(agoComputed, agoResult)
    }
    
    // MARK: Days
    
    func testDayAgoPositive() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let dateAgo = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let provider = TimeAgoProvider(date: dateAgo, fullTimeFormatter: formatter)
        let dayAgoComputed = provider.timeAgo()
        let dayAgoResult = L10n.Time.dayAgo(1)
        XCTAssertEqual(dayAgoComputed, dayAgoResult)
    }
    
    func testDaysAgoPositive() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let dateAgo = Calendar.current.date(byAdding: .day, value: -3, to: Date())!
        let provider = TimeAgoProvider(date: dateAgo, fullTimeFormatter: formatter)
        let dayAgoComputed = provider.timeAgo()
        let dayAgoResult = L10n.Time.daysAgo(3)
        XCTAssertEqual(dayAgoComputed, dayAgoResult)
    }
    
    func testDayAgoNegative() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let dateAgo = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let provider = TimeAgoProvider(date: dateAgo, fullTimeFormatter: formatter)
        let dayAgoComputed = provider.timeAgo()
        let dayAgoResult = L10n.Time.dayAgo(2) // take two days instead of one
        XCTAssertNotEqual(dayAgoComputed, dayAgoResult)
    }
    
    func testMultDaysAgoPositive() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let dateAgo = Calendar.current.date(byAdding: .day, value: -3, to: Date())!
        let provider = TimeAgoProvider(date: dateAgo, fullTimeFormatter: formatter)
        let agoComputed = provider.timeAgo()
        let agoResult = L10n.Time.daysAgoMult(3)
        XCTAssertEqual(agoComputed, agoResult)
    }
    
    // MARK: Months
    
    func testMonthAgo() {
        let formatter = DateFormatters.with(format: "dd-MM-yyyy HH:mm")
        let dateAgo = Calendar.current.date(byAdding: .month, value: -1, to: Date())!
        let provider = TimeAgoProvider(date: dateAgo, fullTimeFormatter: formatter)
        let monthAgoComputed = provider.timeAgo()
        let monthAgoResult = formatter.string(from: dateAgo)
        XCTAssertEqual(monthAgoComputed, monthAgoResult)
    }
    
}
