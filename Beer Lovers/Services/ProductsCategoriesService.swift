//
//  ProductsCategoriesService.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

import Foundation

class ProductsCategoriesService: BaseService {
    
    static let shared = ProductsCategoriesService()
    
    func getAllProductsCategories(success: @escaping ([AllCategoriesSearchQuery.Data.AllCategory?]) -> Void, failure: @escaping FAILURE_HANDLER) {
        
        let ProductsCategoriesQuery = AllCategoriesSearchQuery()
        
        apollo?.fetch(query: ProductsCategoriesQuery) {
            
            result, error in
            
            guard let result = result?.data?.allCategory else {
                failure(error)
                return
            }
            
            success(result)
        }
    }
}
