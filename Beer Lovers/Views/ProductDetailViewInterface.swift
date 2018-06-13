//
//  ProductDetailViewInterface.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 16/05/18.
//

import UIKit

protocol ProductDetailViewInterface {
    func setupDefaultProductImage()
    func setupProductImage(_ productImageUrl: URL)
    func setupProductTitle(_ productTitle: String)
    func setupProductPrice(_ productPrice: String)
    func setupProductDescription(_ productDescription: String)
}
