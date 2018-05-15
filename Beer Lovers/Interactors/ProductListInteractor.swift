//
//  ProductListInteractor.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

import UIKit

class ProductListInteractor: NSObject {
    
    var interactorOutput    : ProductListInteractorOutput?
    
    init(output: ProductListInteractorOutput) {
        super.init()
        
        self.interactorOutput = output
    }
}


// MARK: ProductListInteractorInput

extension ProductListInteractor: ProductListInteractorInput {
    func fetchAllProductsCategories() {
        ProductsCategoriesService.shared.getAllProductsCategories(success: {
            (results) in
            
            guard !results.isEmpty else {
                self.interactorOutput?.errorWhileFetchingProductsCategories()
                return
            }
            
            self.interactorOutput?.foundProductsCategories(results)
            
        }) { (error) in
            self.interactorOutput?.errorWhileFetchingProductsCategories()
        }
    }
}
