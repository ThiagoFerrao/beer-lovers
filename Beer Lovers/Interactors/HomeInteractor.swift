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
    
    
    // Mark: Private Methods
    
    func foundAddressLagLong(latitude: String, longitude: String) {
        PointOfContactService.shared.getNearestPointOfContact(latitude: latitude, longitude: longitude, success: {
            (results) in
            
            guard !results.isEmpty, let result = results[0] else {
                self.interactorOutput?.errorWhileFetchingThePointOfContactInfo()
                return
            }
            
            self.interactorOutput?.foundPointOfContact(result)
            
        }) { (error) in
            self.interactorOutput?.errorWhileFetchingThePointOfContactInfo()
        }
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
            self.interactorOutput?.errorWhileFetchingThePointOfContactInfo()
            return
        }
        
        placesClient.lookUpPlaceID(placeID, callback: {
            
            (result, error) in
            
            guard let result = result else {
                self.interactorOutput?.errorWhileFetchingThePointOfContactInfo()
                return
            }
            
            self.foundAddressLagLong(latitude: String(result.coordinate.latitude), longitude: String(result.coordinate.longitude))
        })
    }
}
