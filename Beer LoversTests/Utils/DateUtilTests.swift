//
//  DateUtilTests.swift
//  Beer LoversTests
//
//  Created by Thiago Ferrão on 12/06/18.
//

import XCTest
@testable import Beer_Lovers

class DateUtilTests: XCTestCase {
    
    func testgetStringFromDate() {
        let dateString = "1980-07-11T08:34:00.000-03:00"
        
        var dateComponents = DateComponents()
        dateComponents.year = 1980
        dateComponents.month = 7
        dateComponents.day = 11
        dateComponents.hour = 8
        dateComponents.minute = 34
        
        let currentCalendarDate = Calendar.current
        let preDefinedDate = currentCalendarDate.date(from: dateComponents)
        
        let preDefinedDateInString = DateUtil.shared.getStringFromDate(date: preDefinedDate!)
        
        XCTAssertEqual(preDefinedDateInString, dateString)
    }
}
