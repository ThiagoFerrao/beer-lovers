//
//  ProductListModuleInterface.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

protocol ProductListModuleInterface {
    func viewDidLoadWithPointOfContact(_ pointOfContact: PocSearchMethodQuery.Data.PocSearch?)
    func newCategoryWasSelectedWithIndex(_ selectedIndex: Int)
    func categoryWasSelectedWithID(_ categoryID: String?)
    func productWasSelected(product: PocCategorySearchQuery.Data.Poc.Product.ProductVariant?)
}
