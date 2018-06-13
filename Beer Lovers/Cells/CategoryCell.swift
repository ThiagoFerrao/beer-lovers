//
//  CategoryCell.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryLabel    : UILabel!
    @IBOutlet weak var divider          : UIView!
    
    var productCategory: AllCategoriesSearchQuery.Data.AllCategory? {
        didSet {
            categoryLabel.text = productCategory?.title
        }
    }
    
    var isLastCell: Bool? {
        didSet {
            divider.isHidden = isLastCell ?? false
        }
    }
    
    var isCellSelected: Bool? {
        didSet {
            guard isCellSelected ?? false else {
                categoryLabel.textColor = COLORS.GRAY
                return
            }
            
            categoryLabel.textColor = COLORS.YELLOW
        }
    }
}
