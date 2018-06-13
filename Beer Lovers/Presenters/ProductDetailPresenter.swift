//
//  ProductDetailPresenter.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 16/05/18.
//

import UIKit

class ProductDetailPresenter: NSObject {
    
    var userInterface: ProductDetailViewInterface?
    
    init(userInterface: ProductDetailViewInterface) {
        super.init()
        
        self.userInterface = userInterface
    }
}


// MARK: ProductDetailModuleInterface

extension ProductDetailPresenter: ProductDetailModuleInterface {
    func viewDidLoadWithProduct(_ product: PocCategorySearchQuery.Data.Poc.Product.ProductVariant?) {
        guard let product = product else {
            return
        }
        
        if let imageValue = product.imageUrl, let imageUrl = URL(string: imageValue) {
            userInterface?.setupProductImage(imageUrl)
        } else {
            userInterface?.setupDefaultProductImage()
        }
        
        userInterface?.setupProductTitle(product.title)
        
        if let priceValue = product.price {
            userInterface?.setupProductPrice("R$ \(String(format:"%.2f", priceValue))")
        } else {
            userInterface?.setupProductPrice("Product without price")
        }
        
        userInterface?.setupProductDescription(product.description ?? "Product without description")
    }
}
