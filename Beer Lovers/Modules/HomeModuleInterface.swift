//
//  HomeModuleInterface.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

import GooglePlaces

protocol HomeModuleInterface {
    func viewDidLoad()
    func cellWasSelectedWithAddress(_ addressSelected: GMSAutocompletePrediction)
}
