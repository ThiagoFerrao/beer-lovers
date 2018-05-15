//
//  ProductsCategoriesService.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

import Foundation

class ProductsCategoriesService : NSObject {
    
    static let shared = ProductsCategoriesService()
    
    func getAllProductsCategories() {
        
        let ProductsCategoriesQuery = AllCategoriesSearchQuery()
        
        apollo?.fetch(query: ProductsCategoriesQuery) {
            
            result, error in
            
            guard let result = result?.data?.allCategory else {
                print("Error")
                return
            }
            
            print(result)
            return
        }
    }
}
