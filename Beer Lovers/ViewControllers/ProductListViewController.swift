//
//  ProductListViewController.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var categoriesCollectionView     : UICollectionView!
    @IBOutlet weak var productsCollectionView       : UICollectionView!
    @IBOutlet weak var categoriesLoadingIndicator   : UIActivityIndicatorView!
    @IBOutlet weak var productsLoadingIndicator     : UIActivityIndicatorView!
    
    var selectedCategoryIndex   = -1
    
    var pointOfContact          : PocSearchMethodQuery.Data.PocSearch?
    var eventHandler            : ProductListModuleInterface?
    
    var categoriesList          = [AllCategoriesSearchQuery.Data.AllCategory?]()
    var productsList            = [PocCategorySearchQuery.Data.Poc.Product.ProductVariant?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = ProductListPresenter(userInterface: self)
        eventHandler?.viewDidLoadWithPointOfContact(pointOfContact)
    }
    
    
    // MARK: Private Methods:
    
    private func updateCategoryCellAtIndex(_ index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        
        guard let categoryCell = categoriesCollectionView.cellForItem(at: indexPath) as? CategoryCell else {
            categoriesCollectionView.reloadItems(at: [indexPath])
            return
        }
        
        categoryCell.isCellSelected = index == selectedCategoryIndex
    }
}


// MARK: ProductListViewInterface

extension ProductListViewController: ProductListViewInterface {
    func setupViewCotrollerTitle(_ title: String) {
        self.title = title
    }
    
    func updateCategoriesCollectionView(productsCategories: [AllCategoriesSearchQuery.Data.AllCategory?]) {
        self.categoriesList = productsCategories
        categoriesCollectionView.reloadData()
    }
    
    func updateProductsCollectionView(productList: [PocCategorySearchQuery.Data.Poc.Product.ProductVariant?]) {
        self.productsList = productList
        productsCollectionView.reloadData()
    }
    
    func showsCategoriesLoading() {
        categoriesLoadingIndicator.isHidden = false
    }

    func hidesCategoriesLoading() {
        categoriesLoadingIndicator.isHidden = true
    }

    func showsProductsLoading() {
        productsLoadingIndicator.isHidden = false
    }
    
    func hidesProductsLoading() {
        productsLoadingIndicator.isHidden = true
    }
    
    func updateSelectedIndexTo(_ newSelectedIndex: Int) {
        let oldSelectedIndex = selectedCategoryIndex
        selectedCategoryIndex = newSelectedIndex
        
        updateCategoryCellAtIndex(oldSelectedIndex)
        updateCategoryCellAtIndex(newSelectedIndex)
    }
    
    func cleanCurrentProductList() {
        productsList = [PocCategorySearchQuery.Data.Poc.Product.ProductVariant?]()
        productsCollectionView.reloadData()
    }
}


// MARK: UICollectionViewDataSource

extension ProductListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoriesCollectionView:
            return categoriesList.count
            
        case productsCollectionView:
            return productsList.count
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoriesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_IDENTIFIERS.PRODUCT_LIST.CATEGORY_CELL, for: indexPath) as! CategoryCell
            cell.productCategory = categoriesList[indexPath.row]
            cell.isLastCell = categoriesList.count == indexPath.row + 1
            cell.isCellSelected = indexPath.row == selectedCategoryIndex
            
            return cell
            
        case productsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_IDENTIFIERS.PRODUCT_LIST.PRODUCT_CELL, for: indexPath) as! ProductCell
            cell.productInfo = productsList[indexPath.row]
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}


// MARK: UICollectionViewDelegate

extension ProductListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case categoriesCollectionView:
            eventHandler?.newCategoryWasSelectedWithIndex(indexPath.row)
            eventHandler?.categoryWasSelectedWithID(categoriesList[indexPath.row]?.id)
            return
            
        case productsCollectionView:
            return
            
        default:
            return
        }
    }
}
