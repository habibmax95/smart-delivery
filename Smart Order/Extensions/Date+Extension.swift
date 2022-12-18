//
//  Date+Extension.swift
//  Smart Order
//
//  Created by Office on 12/7/22.
//

import Foundation

extension Date {
    /// Returns if the current date falls between a range of two dates
    /// - parameter date1: Start date of the range
    /// - parameter date2: End date of the range
    /// - returns: if the current date falls between given dates range
    func isBetween(_ date1: Date, and date2: Date) -> Bool {
        return (date1 ... date2).contains(self) // date1 ... date2: returns a closed range that contains both of its bounds.
    }
    
    /// Returns a date by adding days to it
    /// - parameter daysToAdd: Number of days to add
    /// - returns: Date by adding the specified days
    func addDays(daysToAdd: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: daysToAdd, to: self)!
    }
    
    /// Returns a weekday of a date
    /// - returns: Returns a weekday of a date
    func weekDay() -> Weekday {
        return Weekday(rawValue: Calendar.current.component(.weekday, from: self))!
    }
    
    /// Create a date from specified parameters
    ///
    /// - Parameters:
    ///   - year: The desired year
    ///   - month: The desired month
    ///   - day: The desired day
    /// - Returns: A `Date` object
    static func from(year: Int, month: Int, day: Int) -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return calendar.date(from: dateComponents) ?? nil
    }
}
