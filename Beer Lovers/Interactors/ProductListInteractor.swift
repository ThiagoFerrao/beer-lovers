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
    
    func fetchPointOfContactProductList(pointOfContactID: String?, categoryID: String?) {
        guard let pointOfContactID = pointOfContactID, let categoryString = categoryID, let categoryID = Int(categoryString) else {
            self.interactorOutput?.errorWhileFetchingProductList()
            return
        }
        
        PointOfContactService.shared.getProductListFromPointOfContact(pointOfContactID: pointOfContactID, productCategoryID: categoryID, success: {
            (result) in
            
            guard let results = result.products, !results.isEmpty else {
                self.interactorOutput?.errorWhileFetchingProductList()
                return
            }
            
            self.interactorOutput?.foundProductList(results)
            
        }) { (error) in
            self.interactorOutput?.errorWhileFetchingProductList()
        }
    }
}
