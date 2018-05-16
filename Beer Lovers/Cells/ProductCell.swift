//
//  ProductCell.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage         : UIImageView!
    @IBOutlet weak var productTitle         : UILabel!
    @IBOutlet weak var productPrice         : UILabel!
    
    var productInfo: PocCategorySearchQuery.Data.Poc.Product.ProductVariant? {
        didSet {
//            productImage.image = productInfo?.imageUrl
            
            productTitle.text = productInfo?.title
            setupProductPrice(productInfo?.price)
        }
    }
    
    
    // MARK: Private Methods
    
    private func setupProductPrice(_ price: Double?) {
        guard let price = price else {
            productPrice.text = "Unknown Price"
            return
        }
        
        let value = String(format:"%.2f", price)
        productPrice.text = "R$ \(value)"
    }
}
