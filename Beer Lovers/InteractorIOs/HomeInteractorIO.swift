//
//  HomeInteractorIO.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

import GooglePlaces

protocol HomeInteractorInput {
    func fetchAutocompleteAdressesBasedOnValue(_ value: String)
    func fetchLatLongFromAddress(_ address: GMSAutocompletePrediction)
}

protocol HomeInteractorOutput {
    func foundAutocompeteResults(_ autocompleteResults: [GMSAutocompletePrediction])
    func emptySearchValueWasPassed()
    func errorWhileFetchingAutocompeteResults()
    func errorWhileFetchingThePointOfContactInfo()
    func foundPointOfContact(_ pointOfContact: [PocSearchMethodQuery.Data.PocSearch?])
}
