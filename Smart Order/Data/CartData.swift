//
//  CartData.swift
//  Smart Order
//
//  Created by Office on 12/7/22.
//

import Foundation

let cartsData = [
    Product(productId: 1, name: "Apple", deliveryDays: [Weekday.saturday, Weekday.sunday, Weekday.monday, Weekday.wednesday], productType: ProductType.normal, daysInAdvance: 1),
    Product(productId: 2, name: "Spenaut", deliveryDays: [Weekday.saturday, Weekday.sunday, Weekday.tuesday, Weekday.monday, Weekday.friday], productType: ProductType.temporary, daysInAdvance: 1),
//    Product(productId: 3, name: "Chinese Okra", deliveryDays: [Weekday.sunday, Weekday.monday, Weekday.wednesday], productType: ProductType.external, daysInAdvance: 4),
    Product(productId: 4, name: "Shampoo", deliveryDays: [Weekday.saturday, Weekday.sunday, Weekday.monday, Weekday.tuesday, Weekday.wednesday], productType: ProductType.normal, daysInAdvance: 1),
    Product(productId: 5, name: "Diska", deliveryDays: [Weekday.saturday, Weekday.sunday, Weekday.monday, Weekday.wednesday], productType: ProductType.normal, daysInAdvance: 1),
    
]
