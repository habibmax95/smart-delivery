//
//  DeliveryDateFilterService.swift
//  Smart Order
//
//  Created by Office on 11/8/22.
//

import Foundation

struct DeliveryDateFilterService {
    
    let calendar = Calendar.current
    let now = Date()
    
    /// Filters delivery dates  based on how many days advance the product needs to be delivered
    /// - parameter numberOfDaysAdvance: how many days before the products needs to be delivered
    /// - parameter filterableDates: List of delivery dates
    func filterBy(numberOfDaysAdvance: Int, filterableDates: inout [DeliveryDate]) {
        filterableDates.removeAll(where: {
            return calendar.numberOfDaysBetween(now, and: $0.deliveryDate) <=  numberOfDaysAdvance
        })
    }
    
    /// Filters delivery dates  based on available product delivery days
    /// - parameter productDeliveryDays: Weekday on which the product can be delivered
    func filterBy(productDeliveryDays: [Weekday], filterableDates: inout [DeliveryDate]) {
        filterableDates.removeAll(where: {
            !productDeliveryDays.contains($0.deliveryDate.weekDay())
        })
    }
    
    /// Filters delivery dates  based on current week's weekdays (mon - sun)
    /// 
    func filterByCurrentWeekdays(filterableDates: inout [DeliveryDate]) {
        let nextSunday = calendar.nextMonday(weekday: Weekday.monday.rawValue, after: now)
            .addDays(daysToAdd: -1)
        filterableDates.removeAll(where: {
            let deliveryDate = $0.deliveryDate
            return !deliveryDate.isBetween(now, and: nextSunday)
        })
    }
}

