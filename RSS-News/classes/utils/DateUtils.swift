//
//  DateUtils.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/20/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation

final class DateUtils {
    
    static func timeAgo(from date: Date, fullTimeFormat: String) -> String {
        var secondsAgo = Int(Date().timeIntervalSince(date))
        if secondsAgo < 0 {
            secondsAgo *= (-1)
        }
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        
        if secondsAgo < minute {
            if secondsAgo < 5 {
                return L10n.Time.justNow
            } else {
                return L10n.Time.secsAgo(secondsAgo)
            }
        } else if secondsAgo < hour {
            let min = secondsAgo / minute
            if min == 1 {
                return L10n.Time.minAgo(min)
            } else {
                return L10n.Time.minsAgo(min)
            }
        } else if secondsAgo < day {
            let hr = secondsAgo / hour
            if hr == 1 {
                return L10n.Time.hrAgo(hr)
            } else {
                return L10n.Time.hrsAgo(hr)
            }
        } else if secondsAgo < week {
            let day = secondsAgo / day
            if day == 1 {
                return L10n.Time.dayAgo(day)
            } else {
                return L10n.Time.daysAgo(day)
            }
        } else {
            let formatter = DateFormatters.with(format: fullTimeFormat)
            let strDate: String = formatter.string(from: date)
            return strDate
        }
    }
    
}
