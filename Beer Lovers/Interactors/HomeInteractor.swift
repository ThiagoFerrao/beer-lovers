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
        placesClient.autocompleteQuery(value, bounds: nil, filter: filter, callback: {
            
            (results, error) -> Void in
            
            guard let results = results else {
                print("[HomeInteractor] An Error occurred in the fetchAutocompleteAdressesBasedOnValue method"
                    + " - Error: \(error?.localizedDescription ?? "Unknown")")
                return
            }
            
            self.interactorOutput?.foundAutocompeteResults(results)
        })
    }
}
