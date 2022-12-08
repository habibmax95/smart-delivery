//
//  DeliveryDateResponseModel.swift
//  Smart Order
//
//  Created by Office on 12/7/22.
//

import Foundation

struct DeliveryDateResponse: Codable {
    let status: String
    let data: DeliveryDateData
}
