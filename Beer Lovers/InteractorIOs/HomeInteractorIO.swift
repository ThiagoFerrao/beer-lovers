//
//  HomeInteractorIO.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

import GooglePlaces

protocol HomeInteractorInput {
    func fetchAutocompleteAdressesBasedOnValue(_ value: String)
}

protocol HomeInteractorOutput {
    func foundAutocompeteResults(_ autocompleteResults: [GMSAutocompletePrediction])
}
