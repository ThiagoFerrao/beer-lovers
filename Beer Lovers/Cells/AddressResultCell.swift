//
//  AddressResultCell.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

import UIKit
import GooglePlaces

class AddressResultCell: UITableViewCell {
    
    @IBOutlet weak var cityResultLabel: UILabel!
    
    var addressResult: GMSAutocompletePrediction? {
        didSet {
            guard let addressResult = addressResult else {
                return
            }
            
            cityResultLabel.text = addressResult.attributedFullText.string
        }
    }
}
