//
//  DeliveryDateFilterService.swift
//  Smart Order
//
//  Created by Office on 11/8/22.
//

import Foundation

protocol DeliveryDateFilterProtocol {
    func filterBy(numberOfDaysAdvance: Int, filterableDates: inout [DeliveryDate])
    func filterBy(productDeliveryDays: [Weekday], filterableDates: inout [DeliveryDate])
    func filterByCurrentWeekdays(filterableDates: inout [DeliveryDate])
    
}

struct DeliveryDateFilterService: DeliveryDateFilterProtocol {
    
    private let calendar = Calendar.current
    private let now = Date()
    
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
        let nextSunday = calendar.nextWeekday(weekday: Weekday.sunday.rawValue, after: now)
        filterableDates.removeAll(where: {
            let deliveryDate = $0.deliveryDate
            return !deliveryDate.isBetween(now, and: nextSunday)
        })
    }
}

