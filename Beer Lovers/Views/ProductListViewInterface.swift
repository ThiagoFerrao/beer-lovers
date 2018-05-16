//
//  ProductListViewInterface.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

protocol ProductListViewInterface {
    func setupViewCotrollerTitle(_ title: String)
    func updateCategoriesCollectionView(productsCategories: [AllCategoriesSearchQuery.Data.AllCategory?])
    func updateProductsCollectionView(productList: [PocCategorySearchQuery.Data.Poc.Product.ProductVariant?])
    func showsCategoriesLoading()
    func hidesCategoriesLoading()
    func showsProductsLoading()
    func hidesProductsLoading()
    func updateSelectedIndexTo(_ newSelectedIndex: Int)
}
