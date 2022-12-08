//
//  ContentView.swift
//  Smart Order
//
//  Created by Office on 12/7/22.
//

import SwiftUI

//struct ContentView: View {
//    let deliveryDateResponse: DeliveryDateResponse = Bundle.main.decode("delivery_times.json", dateDecodingStrategy: .iso8601)
//    let carts: [Product] = cartsData
//    
//    var body: some View {
//        
//        VStack {
//            ForEach(getFilteredDates(), id: \.self) { dateItem in
//                Text(dateItem.deliveryDate.formatted())
//                Text(dateItem.isGreenDelivery ? "True" : "False")
//            }
//        }
//        .padding()
//    }
//    
//    func getDateFormatter() -> DateFormatter {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
//        return dateFormatter
//    }
//    
//    func getWeekday() {
//        let weekday = Calendar.current.component(.weekday, from: deliveryDateResponse.data.deliveryDates[0].deliveryDate)
//        print(weekday)
//    }
//    
//    func getFilteredDates() -> [DeliveryDate] {
//        var filteredDates = deliveryDateResponse.data.deliveryDates
//        
//        for date in Calendar.current.currentWeekDays() {
//            print(date.formatted())
//        }
//        
//        
//        for product in carts {
//            let calendar = Calendar.current
//            let now = Date()
//            
//            // all external products need to be ordered 5 days in in advance
//            if (product.productType == .external) {
//                filteredDates.removeAll(where: {
//                    calendar.numberOfDaysBetween(now, and: $0.deliveryDate) <=  5
//                })
//            }
//            // a delivery date is not valid if a product must be ordered more days in advance than possible
//            else {
//                filteredDates.removeAll(where: {
//                    calendar.numberOfDaysBetween(now, and: $0.deliveryDate) <=  product.daysInAdvance
//                })
//            }
//            
//            // a delivery date is not valid if a product can't be delivered on that weekday
//            filteredDates.removeAll(where: {
//                !product.deliveryDays.contains(Weekday(rawValue: calendar.component(.weekday, from: $0.deliveryDate))!)
//            })
//            
//            //print(Calendar.current.isDate(now, equalTo: calendar.currentWeekDays()[2], toGranularity: .day))
//            
//            print(calendar.currentWeekDays()[3].formatted())
//            print(now.formatted())
//            //print(calendar.isSameDay(date1: now, date2: calendar.currentWeekDays()[4]))
//            print(Calendar.current.isDate(now, equalTo: calendar.currentWeekDays()[3], toGranularity: .day))
//            if let timeInterval = calendar.nextWeekend(startingAfter: now, direction: .forward) {
//                let startDate = timeInterval.start
//                let endDate = timeInterval.end
//                print(startDate, endDate)
//            }
//            
//            
//            // temporary products can only be ordered within the current week (Mon-Sun)
//            if product.productType == .temporary {
//                let nextMonDate = calendar.date(byAdding: .day, value: -1, to: nextMonday())!
//                filteredDates.removeAll(where: {
//                    let deliveryDate = $0.deliveryDate
//                    
//                    return !deliveryDate.isBetween(now, and: nextMonDate)
//                    //return !calendar.isDateInWeekend(deliveryDate)
//    //                return !Calendar.current.currentWeekDays().contains(where: {
//    //                    Calendar.current.isDate($0, equalTo: deliveryDate, toGranularity: .day)
//    //                })
//                })
//            }
//            
//            
//            
//            
//        }
//        
//        return filteredDates
//    }
//    
//    
//    func sortDates(deliveryDates: [DeliveryDate])-> [DeliveryDate] {
//        return deliveryDates.sorted(by: {
//            if $0.isGreenDelivery == $1.isGreenDelivery {
//                return $0.deliveryDate < $1.deliveryDate
//            } else if $0.isGreenDelivery {
//                return true
//            } else if $1.isGreenDelivery {
//                return false
//            }
//            
//            return $0.deliveryDate < $1.deliveryDate
//            
//        })
//    }
//    
//    func nextMonday() -> Date {
//        var cal = Calendar.current
//        var comps = DateComponents()
//        comps.weekday = 2
//        let now = Date()
//        print(now.formatted())
//        if let nextMonday = cal.nextDate(after: now, matching: comps, matchingPolicy: .nextTimePreservingSmallerComponents) {
//            print("next monday \(nextMonday.formatted())")
//            return nextMonday
//        }
//        
//        return now
//        
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


