//
//  HomeInteractor.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 15/05/18.
//

import Foundation
import GooglePlaces

class HomeInteractor: NSObject {
    
    var interactorOutput    : HomeInteractorOutput?
    var filter              : GMSAutocompleteFilter {
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        return filter
    }
    let placesClient        = GMSPlacesClient()

    init(output: HomeInteractorOutput) {
        super.init()
        
        self.interactorOutput = output
    }
}


// MARK: HomeInteractorInput

extension HomeInteractor: HomeInteractorInput {
    func fetchAutocompleteAdressesBasedOnValue(_ value: String) {
        
        guard (value != "") else {
            self.interactorOutput?.emptySearchValueWasPassed()
            return
        }
        
        placesClient.autocompleteQuery(value, bounds: nil, filter: filter, callback: {
            
            (results, error) -> Void in
            
            guard let results = results else {
                self.interactorOutput?.errorWhileFetchingAutocompeteResults()
                return
            }
            
            guard !results.isEmpty else {
                self.interactorOutput?.errorWhileFetchingAutocompeteResults()
                return
            }
            
            self.interactorOutput?.foundAutocompeteResults(results)
        })
    }
    
    func fetchLatLongFromAddress(_ address: GMSAutocompletePrediction) {
        guard let placeID = address.placeID else {
            self.interactorOutput?.errorWhileFetchingLatLong()
            return
        }
        
        placesClient.lookUpPlaceID(placeID, callback: {
            
            (result, error) in
            
            guard let result = result else {
                self.interactorOutput?.errorWhileFetchingLatLong()
                return
            }
            
            self.interactorOutput?.foundAddressLagLong((String(result.coordinate.latitude), String(result.coordinate.longitude)), fullAddressText: address.attributedFullText.string)
        })
    }
}
