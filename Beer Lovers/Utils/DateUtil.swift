//
//  DateUtil.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

import Foundation

class DateUtil: NSObject {
    
    static let shared           = DateUtil()
    private let dateFormatter   = DateFormatter()
    
    func getStringFromDate(date: Date) -> String {
        dateFormatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale?
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        let value = dateFormatter.string(from: date)
        return value
    }
}
