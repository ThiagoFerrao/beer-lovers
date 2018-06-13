//
//  ProductCell.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

import UIKit
import Kingfisher

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage         : UIImageView!
    @IBOutlet weak var productTitle         : UILabel!
    @IBOutlet weak var productPrice         : UILabel!
    
    var productInfo: PocCategorySearchQuery.Data.Poc.Product.ProductVariant? {
        didSet {
            setupProductImage(productInfo?.imageUrl)
            productTitle.text = productInfo?.title
            setupProductPrice(productInfo?.price)
        }
    }
    
    
    // MARK: Private Methods
    
    private func setupProductImage(_ imageUrl: String?) {
        guard let urlString = imageUrl, let url = URL(string: urlString) else {
            productImage.image = UIImage(named: "icon_app")
            return
        }
        
        productImage.kf.setImage(with: url
            , placeholder: UIImage(named: "icon_app")
            , options: [
                .transition(.fade(1)),
                .processor(DefaultImageProcessor.default)
            ], progressBlock: nil, completionHandler: nil)
    }
    
    private func setupProductPrice(_ price: Double?) {
        guard let price = price else {
            productPrice.text = "Unknown Price"
            return
        }
        
        let value = String(format:"%.2f", price)
        productPrice.text = "R$ \(value)"
    }
}
