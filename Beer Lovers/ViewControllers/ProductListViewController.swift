//
//  ProductListViewController.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

import UIKit

class ProductListViewController: UIViewController {
    
    var fullAddressText : String?
    var tupleLatLong    : (String, String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = fullAddressText
    }
}
