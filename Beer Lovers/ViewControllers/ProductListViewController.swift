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
    
    var pointOfContact      : PocSearchMethodQuery.Data.PocSearch?
    var eventHandler        : ProductListModuleInterface?
    
    var productsCategories  = [AllCategoriesSearchQuery.Data.AllCategory?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = ProductListPresenter(userInterface: self)
        eventHandler?.viewDidLoadWithPointOfContact(pointOfContact)
    }
}


// MARK: ProductListViewInterface

extension ProductListViewController: ProductListViewInterface {
    func setupViewCotrollerTitle(_ title: String) {
        self.title = title
    }
    
    func updatecategoriesCollectionView(productsCategories: [AllCategoriesSearchQuery.Data.AllCategory?]) {
        self.productsCategories = productsCategories
        categoriesCollectionView.reloadData()
    }
}


// MARK: UICollectionViewDataSource

extension ProductListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoriesCollectionView:
            return productsCategories.count
            
        case productsCollectionView:
            return 0
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoriesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_IDENTIFIERS.PRODUCT_LIST.CATEGORY_CELL, for: indexPath) as! CategoryCell
            cell.productCategory = productsCategories[indexPath.row]
            
            return cell
            
        case productsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_IDENTIFIERS.PRODUCT_LIST.PRODUCT_CELL, for: indexPath) as! ProductCell
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}


// MARK: UICollectionViewDelegate

extension ProductListViewController: UICollectionViewDelegate {
    
}
