//
//  DeliveryDateSorterTests.swift
//  Smart OrderTests
//
//  Created by Office on 12/18/22.
//

import XCTest

final class DeliveryDateSorterTests: XCTestCase {
    
    let sortService = DeliveryDateSortService()

    func testCompareValidGreenDeliverySort() {
        let testDateRes: DeliveryDateResponse = Bundle.main.decode("delivery_times_test.json", dateDecodingStrategy: .iso8601)
        let expectedDateRes: DeliveryDateResponse = Bundle.main.decode("delivery_times_expected.json", dateDecodingStrategy: .iso8601)
    
        let today = Date.from(year: 2022, month: 12, day: 12)!
        let test = testDateRes.data.deliveryDates
        let expected = expectedDateRes.data.deliveryDates
        var sorted = test
        sortService.sortDates(now: today, deliveryDates: &sorted)
        for i in 0 ..< test.count {
            XCTAssertEqual(expected[i], sorted[i], "the array isn't sorted properly")
        }
    }
    

}
