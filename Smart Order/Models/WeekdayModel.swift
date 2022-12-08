//
//  WeekdayModel.swift
//  Smart Order
//
//  Created by Office on 12/7/22.
//

import Foundation

// mimicing apples weekday property functionality through enum
// for better readibility and comparision
// https://developer.apple.com/documentation/foundation/nsdatecomponents/1410442-weekday

enum Weekday : Int {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
}
