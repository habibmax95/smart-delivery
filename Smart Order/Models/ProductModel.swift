//
//  ProductModel.swift
//  Smart Order
//
//  Created by Office on 12/7/22.
//

import Foundation

struct Product {
    var productId: Int
    var name: String
    var deliveryDays: [Weekday]
    var productType: ProductType
    var daysInAdvance: Int
}
