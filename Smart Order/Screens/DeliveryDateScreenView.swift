//
//  DeliveryDateScreenView.swift
//  Smart Order
//
//  Created by Office on 12/7/22.
//

import SwiftUI

struct DeliveryDateScreenView: View {
    
    @StateObject private var viewModel = DeliveryDateViewModel()
    
    var body: some View {
        VStack {
            if viewModel.deliveryDates.count == 0 {
                Text("No delivery dates available")
            } else {
                ForEach(viewModel.deliveryDates, id: \.self) { dateItem in
                    DeliveryDateItemView(deliveryDate: dateItem)
                }
            }
        }
        .onAppear {
            viewModel.filterDates()
        }
    }
}

struct DeliveryDateScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryDateScreenView()
    }
}
