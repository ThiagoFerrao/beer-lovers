//
//  ProductDetailViewController.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var productImage         : UIImageView!
    @IBOutlet weak var productTitle         : UILabel!
    @IBOutlet weak var productPrice         : UILabel!
    @IBOutlet weak var productDescription   : UILabel!
    
    var product : PocCategorySearchQuery.Data.Poc.Product.ProductVariant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
