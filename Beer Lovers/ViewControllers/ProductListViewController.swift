//
//  ProductListViewController.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var categoriesCollectionView : UICollectionView!
    @IBOutlet weak var productsCollectionView   : UICollectionView!
    
    var pointOfContact  : [PocSearchMethodQuery.Data.PocSearch?]?
    var eventHandler    : ProductListModuleInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = ProductListPresenter(userInterface: self)
    }
}


// MARK: ProductListViewInterface

extension ProductListViewController: ProductListViewInterface {
    
}
