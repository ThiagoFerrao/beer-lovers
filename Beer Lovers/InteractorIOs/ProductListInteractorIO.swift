//
//  ProductListInteractorIO.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

protocol ProductListInteractorInput {
    func fetchAllProductsCategories()
    func fetchPointOfContactProductList(pointOfContactID: String?, categoryID: String?)
}

protocol ProductListInteractorOutput {
    func foundProductsCategories(_ productsCategories: [AllCategoriesSearchQuery.Data.AllCategory?])
    func errorWhileFetchingProductsCategories()
    func foundProductList(_ productList: [PocCategorySearchQuery.Data.Poc.Product.ProductVariant?])
    func errorWhileFetchingProductList()
}
