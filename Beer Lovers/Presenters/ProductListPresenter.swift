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
}


// MARK: ProductListModuleInterface

extension ProductListPresenter: ProductListModuleInterface {
    
}


// MARK: ProductListInteractorOutput

extension ProductListPresenter: ProductListInteractorOutput {
    
}
