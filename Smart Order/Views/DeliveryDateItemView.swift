//
//  DeliveryDateItemView.swift
//  Smart Order
//
//  Created by Office on 12/7/22.
//

import SwiftUI

struct DeliveryDateItemView: View {
    let deliveryDate: DeliveryDate
    var body: some View {
        HStack {
            Text(deliveryDate.deliveryDate.formatted())
            Text("->")
            Text(deliveryDate.isGreenDelivery ? "Green" : "Not Green")
        }.padding(4)
    }
}
