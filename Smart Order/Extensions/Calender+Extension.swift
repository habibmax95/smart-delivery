//
//  Calender+Extension.swift
//  Smart Order
//
//  Created by Office on 12/7/22.
//

import Foundation

extension Calendar {
    /// Returns number of days between two dates exculding the start day
    /// - parameter from: Start date
    /// - parameter to: End date
    /// - returns: Number of days between
    ///
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from) // <1>
        let toDate = startOfDay(for: to) // <2>
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
        return numberOfDays.day!
    }
    
    /// Returns next date of a weekday  from a particular weekday date
    /// - parameter weekday: Next weekday
    /// - parameter after: The date after
    /// - returns: Returns next date of specified weekday from the  specified date
    func nextWeekday(weekday: Int, after: Date) -> Date {
        var comps = DateComponents()
        comps.weekday = weekday
        let nextMonday = self.nextDate(after: after, matching: comps, matchingPolicy: .nextTimePreservingSmallerComponents)!
        
        return nextMonday
    }
    
}
