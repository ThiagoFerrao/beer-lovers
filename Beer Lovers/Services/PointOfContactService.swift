//
//  PointOfContactService.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

import Foundation

class PointOfContactService : NSObject {
    
    static let shared = PointOfContactService()
    
    func getNearestPointOfContactInfo(searchedLat: String, searchedLong: String) {
        
        let currentDate = DateUtil.shared.getStringFromDate(date: Date())
        let POCSearchQuery = PocSearchMethodQuery(now: currentDate, algorithm: "NEAREST", lat: searchedLat, long: searchedLong)
        
        apollo?.fetch(query: POCSearchQuery) {
            
            result, error in
            
            guard let result = result?.data?.pocSearch else {
                print("Error")
                return
            }
            
            print(result)
            return
        }
    }
    
    func getProductListFromPointOfContact(pointOfContactID: String, productCategoryID: Int) {
        
        let POCProducts = PocCategorySearchQuery(id: pointOfContactID, search: "", categoryId: productCategoryID)
        
        apollo?.fetch(query: POCProducts) {
            
            result, error in
            
            guard let result = result?.data?.poc else {
                print("Error")
                return
            }
            
            print(result)
            return
        }
    }
}
