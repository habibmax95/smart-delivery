//
//  DeliveryDateSortService.swift
//  Smart Order
//
//  Created by Office on 11/8/22.
//

import Foundation

protocol DeliveryDateSortProtocol {
    func sortDates(now: Date, deliveryDates: inout [DeliveryDate])
}

struct DeliveryDateSortService: DeliveryDateSortProtocol {
    
    /// Sort delivery dates based on two criteria
    /// 1. green delivery dates shoudl be at the top of the list if they are within the next 3 days
    /// 2. otherwise dates should just be sorted ascending
    /// - parameter now: Current date
    /// - parameter deliveryDates: A list of DeliveryDate
    func sortDates(now: Date, deliveryDates: inout [DeliveryDate]) {
        deliveryDates = deliveryDates.sorted(by: {
            let gdMaxDate = now.addDays(daysToAdd: 3)
            // green delivery dates shoudl be at the top of the list if they are within the next 3 days
            
            // if both of them is green delivery, sort by date btween them
            if $0.isGreenDelivery && $0.deliveryDate.isBetween(now, and: gdMaxDate){
                if $1.isGreenDelivery && $1.deliveryDate.isBetween(now, and: gdMaxDate) {
                    return $0.deliveryDate < $1.deliveryDate
                } else {
                    return true
                }
            } else if $1.isGreenDelivery && $1.deliveryDate.isBetween(now, and: gdMaxDate) { // $0 -> not green || $1 -> green, so needs to be switched
                return false
            }
            
            // otherwise dates should just be sorted ascending
            return $0.deliveryDate < $1.deliveryDate
        })
    }
}
