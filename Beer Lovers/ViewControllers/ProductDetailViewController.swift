//
//  ProductDetailViewController.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

import UIKit
import Kingfisher

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var productImage         : UIImageView!
    @IBOutlet weak var productTitle         : UILabel!
    @IBOutlet weak var productPrice         : UILabel!
    @IBOutlet weak var productDescription   : UILabel!
    
    var eventHandler    : ProductDetailModuleInterface?
    var product         : PocCategorySearchQuery.Data.Poc.Product.ProductVariant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = ProductDetailPresenter(userInterface: self)
        eventHandler?.viewDidLoadWithProduct(product)
    }
}


// MARK: ProductDetailViewInterface

extension ProductDetailViewController: ProductDetailViewInterface {
    func setupDefaultProductImage() {
        self.productImage.image = UIImage(named: "icon_app")
    }
    
    func setupProductImage(_ productImageUrl: URL) {
        self.productImage.kf.setImage(with: productImageUrl
            , placeholder: UIImage(named: "icon_app")
            , options: [
                .transition(.fade(1)),
                .processor(DefaultImageProcessor.default)
            ], progressBlock: nil, completionHandler: nil)
    }
    
    func setupProductTitle(_ productTitle: String) {
        self.productTitle.text = productTitle
    }
    
    func setupProductPrice(_ productPrice: String) {
        self.productPrice.text = productPrice
    }
    
    func setupProductDescription(_ productDescription: String) {
        self.productDescription.text = productDescription
    }
}
