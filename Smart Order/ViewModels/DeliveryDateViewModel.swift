//
//  DeliveryDateViewModel.swift
//  Smart Order
//
//  Created by Office on 12/7/22.
//

import Foundation

class DeliveryDateViewModel: ObservableObject {
    @Published var deliveryDates = [DeliveryDate]()
    private let deliveryDateResponse: DeliveryDateResponse = Bundle.main.decode("delivery_times.json", dateDecodingStrategy: .iso8601)
    private let now = Date()
    let carts: [Product] = cartsData
    private var filterService = DeliveryDateFilterService()
    private let sortService = DeliveryDateSortService()
    
    
    func filterDates() {
        var filteredDates = deliveryDateResponse.data.deliveryDates
        
        for product in carts {
            // Temporary products can only be ordered within the current week (Mon-Sun)
            if product.productType == .temporary {
                filterService.filterByCurrentWeekdays(filterableDates: &filteredDates)
            }
            
            // All external products need to be ordered 5 days in in advance
            if (product.productType == .external) {
                filterService.filterBy(numberOfDaysAdvance: NumericConstants.externalDeliveryDaysInAdvance.rawValue, filterableDates: &filteredDates)
            }
            else {
                // A delivery date is not valid if a product must be ordered more days in advance than possible
                filterService.filterBy(numberOfDaysAdvance: product.daysInAdvance, filterableDates: &filteredDates)
            }
            
            // A delivery date is not valid if a product can't be delivered on that weekday
            filterService.filterBy(productDeliveryDays: product.deliveryDays, filterableDates: &filteredDates)
        }
        
        sortService.sortDates(now: now, deliveryDates: &filteredDates)
        
        self.deliveryDates = filteredDates
    }
    
    
}
