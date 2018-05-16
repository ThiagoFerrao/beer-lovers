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
    
    
    // MARK: SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard (segue.identifier == SEGUE_IDENTIFIERS.PRODUCT.TO_PRODUCT_DETAIL) else {
            print("[ProductListViewController] Unknown segue identifier was triggered")
            return
        }
        
        let product = sender as! PocCategorySearchQuery.Data.Poc.Product.ProductVariant?
        let productDetailVC = segue.destination as! ProductDetailViewController
        
        productDetailVC.product = product
    }
    
    
    // MARK: Private Methods
    
    private func updateCategoryCellAtIndex(_ index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        
        guard let categoryCell = categoriesCollectionView.cellForItem(at: indexPath) as? CategoryCell else {
            // fixes a bug in the category collection view that more than one cell's label is coloured as a selected cell,
            // but sometimes crashes the app, probably beacuse the cell doesnt exist while the item is forced to reload
            
            // categoriesCollectionView.reloadItems(at: [indexPath])
            return
        }
        
        categoryCell.isCellSelected = index == selectedCategoryIndex
    }
    
    private func selectFirstCategory() {
        eventHandler?.newCategoryWasSelectedWithIndex(0)
        eventHandler?.categoryWasSelectedWithID(categoriesList[0]?.id)
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
        selectFirstCategory()
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
    
    func showsProductDetailScreenWithProduct(_ product: PocCategorySearchQuery.Data.Poc.Product.ProductVariant?) {
        performSegue(withIdentifier: SEGUE_IDENTIFIERS.PRODUCT.TO_PRODUCT_DETAIL, sender: product)
    }
    
    func showAlert(_ alertController: UIAlertController) {
        present(alertController, animated: true, completion: nil)
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
            guard indexPath.row != selectedCategoryIndex else {
                return
            }
            
            eventHandler?.newCategoryWasSelectedWithIndex(indexPath.row)
            eventHandler?.categoryWasSelectedWithID(categoriesList[indexPath.row]?.id)
            return
            
        case productsCollectionView:
            eventHandler?.productWasSelected(product: productsList[indexPath.row])
            return
            
        default:
            return
        }
    }
}
