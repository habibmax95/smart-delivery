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
            
            // $0 -> green || $1 -> not green, so no needs to be switched
            if isValidGreenDelivery(now: now, deliveryDate: $0) && !isValidGreenDelivery(now: now, deliveryDate: $1){
                return true
            } else if isValidGreenDelivery(now: now, deliveryDate: $1) { // $0 -> not green || $1 -> green, so needs to be switched
                return false
            }
            
            // otherwise dates should just be sorted ascending
            return $0.deliveryDate < $1.deliveryDate
        })
    }
    
    func isValidGreenDelivery(now: Date, deliveryDate: DeliveryDate) -> Bool {
        let gdMaxDate = now.addDays(daysToAdd: 3)
        return deliveryDate.isGreenDelivery && deliveryDate.deliveryDate.isBetween(now, and: gdMaxDate)
    }
}
