//
//  DeliveryDateModel.swift
//  Smart Order
//
//  Created by Office on 12/7/22.
//

import Foundation

struct DeliveryDate: Codable, Hashable{
    let deliveryDate: Date
    let isGreenDelivery: Bool
}
