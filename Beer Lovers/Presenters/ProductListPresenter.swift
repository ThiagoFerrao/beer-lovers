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
        let fullAddress = getPointOfContactFullAddress(pocAddress: pointOfContact?.address)
        userInterface?.setupViewCotrollerTitle(fullAddress)
        
        interactorInput?.fetchAllProductsCategories()
    }
}


// MARK: ProductListInteractorOutput

extension ProductListPresenter: ProductListInteractorOutput {
    func foundProductsCategories(_ productsCategories: [AllCategoriesSearchQuery.Data.AllCategory?]) {
        userInterface?.updatecategoriesCollectionView(productsCategories: productsCategories)
    }
    
    func errorWhileFetchingProductsCategories() {
        // TODO
    }
}
