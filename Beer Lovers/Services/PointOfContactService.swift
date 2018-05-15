//
//  PointOfContactService.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

import Foundation

class PointOfContactService: BaseService {
    
    static let shared = PointOfContactService()
    
    func getNearestPointOfContactInfo(searchedLat: String, searchedLong: String
        , success: @escaping ([PocSearchMethodQuery.Data.PocSearch?]) -> Void
        , failure: @escaping FAILURE_HANDLER) {
        
        let currentDate = DateUtil.shared.getStringFromDate(date: Date())
        let POCSearchQuery = PocSearchMethodQuery(now: currentDate, algorithm: "NEAREST", lat: searchedLat, long: searchedLong)
        
        apollo?.fetch(query: POCSearchQuery) {
            
            result, error in
            
            guard let result = result?.data?.pocSearch else {
                failure(error)
                return
            }
            
            success(result)
        }
    }
    
    func getProductListFromPointOfContact(pointOfContactID: String, productCategoryID: Int
        , success: @escaping (PocCategorySearchQuery.Data.Poc) -> Void
        , failure: @escaping FAILURE_HANDLER) {
        
        let POCProducts = PocCategorySearchQuery(id: pointOfContactID, search: "", categoryId: productCategoryID)
        
        apollo?.fetch(query: POCProducts) {
            
            result, error in
            
            guard let result = result?.data?.poc else {
                failure(error)
                return
            }
            
            success(result)
        }
    }
}
