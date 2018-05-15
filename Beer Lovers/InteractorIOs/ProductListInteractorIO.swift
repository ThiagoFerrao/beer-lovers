//
//  ProductListInteractorIO.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

protocol ProductListInteractorInput {
    func fetchAllProductsCategories()
}

protocol ProductListInteractorOutput {
    func foundProductsCategories(_ productsCategories: [AllCategoriesSearchQuery.Data.AllCategory?])
    func errorWhileFetchingProductsCategories()
}
