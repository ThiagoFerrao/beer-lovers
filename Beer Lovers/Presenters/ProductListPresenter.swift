//
//  ProductListPresenter.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

import UIKit

class ProductListPresenter: NSObject {
    
    var userInterface   : ProductListViewInterface?
    var interactorInput : ProductListInteractorInput?
    
    var pointOfContactID: String?
    
    init(userInterface: ProductListViewInterface) {
        super.init()
        
        self.interactorInput = ProductListInteractor(output: self)
        self.userInterface = userInterface
    }
    
    
    // MARK: Private Methods
    
    private func getPointOfContactFullAddress(pocAddress: PocSearchMethodQuery.Data.PocSearch.Address?) -> String{
        let pocAddress1 = optionalStringToString(pocAddress?.address1)
        let pocAddressCity = optionalStringToString(pocAddress?.city)
        let pocAddressProvince = optionalStringToString(pocAddress?.province)
        
        return "\(pocAddress1) - \(pocAddressCity) - \(pocAddressProvince)"
    }
    
    private func optionalStringToString(_ value: String?) -> String {
        return value ?? ""
    }
}


// MARK: ProductListModuleInterface

extension ProductListPresenter: ProductListModuleInterface {
    func viewDidLoadWithPointOfContact(_ pointOfContact: PocSearchMethodQuery.Data.PocSearch?) {
        pointOfContactID = pointOfContact?.id
        
        let fullAddress = getPointOfContactFullAddress(pocAddress: pointOfContact?.address)
        userInterface?.setupViewCotrollerTitle(fullAddress)
        
        userInterface?.showsCategoriesLoading()
        interactorInput?.fetchAllProductsCategories()
    }
    
    func newCategoryWasSelectedWithIndex(_ selectedIndex: Int) {
        userInterface?.updateSelectedIndexTo(selectedIndex)
    }
    
    func categoryWasSelectedWithID(_ categoryID: String?) {
        userInterface?.cleanCurrentProductList()
        userInterface?.showsProductsLoading()
        interactorInput?.fetchPointOfContactProductList(pointOfContactID: pointOfContactID, categoryID: categoryID)
    }
    
    func productWasSelected(product: PocCategorySearchQuery.Data.Poc.Product.ProductVariant?) {
        userInterface?.showsProductDetailScreenWithProduct(product)
    }
}


// MARK: ProductListInteractorOutput

extension ProductListPresenter: ProductListInteractorOutput {
    func foundProductsCategories(_ productsCategories: [AllCategoriesSearchQuery.Data.AllCategory?]) {
        userInterface?.hidesCategoriesLoading()
        userInterface?.updateCategoriesCollectionView(productsCategories: productsCategories)
    }
    
    func errorWhileFetchingProductsCategories() {
        userInterface?.hidesCategoriesLoading()
        // TODO
    }
    
    func foundProductList(_ productList: [PocCategorySearchQuery.Data.Poc.Product.ProductVariant?]) {
        userInterface?.hidesProductsLoading()
        userInterface?.updateProductsCollectionView(productList: productList)
    }
    
    func errorWhileFetchingProductList() {
        userInterface?.hidesProductsLoading()
        // TODO
    }
}
