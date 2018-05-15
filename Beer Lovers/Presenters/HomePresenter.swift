//
//  HomePresenter.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

import UIKit
import GooglePlaces

class HomePresenter: NSObject {
    
    var userInterface   : HomeViewInterface?
    var interactorInput : HomeInteractorInput?
    
    init(userInterface: HomeViewInterface) {
        super.init()
        
        self.interactorInput = HomeInteractor(output: self)
        self.userInterface = userInterface
    }
}


// MARK: HomeModuleInterface

extension HomePresenter: HomeModuleInterface {
    func viewDidLoad() {
        userInterface?.setupSearchbarWithDelegate(self)
    }
    
    func cellWasSelectedWithAddress(_ addressSelected: GMSAutocompletePrediction) {
        interactorInput?.fetchLatLongFromAddress(addressSelected)
    }
}


// MARK: UISearchBarDelegate

extension HomePresenter: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        interactorInput?.fetchAutocompleteAdressesBasedOnValue(searchText)
    }
}


// MARK: HomeInteractorOutput

extension HomePresenter: HomeInteractorOutput {
    
    func foundAutocompeteResults(_ autocompleteResults: [GMSAutocompletePrediction]) {
        userInterface?.updateTableVieWithAutocompleteResults(autocompleteResults)
    }
    
    func foundAddressLagLong(_ tupleLatLong: (String, String)) {
        userInterface?.presentProductListScreenWithLatLong(tupleLatLong)
    }
    
    func emptySearchValueWasPassed() {
        userInterface?.showEmptyResultsCell()
    }
    
    func errorWhileFetchingAutocompeteResults() {
        userInterface?.showFetchingErrorCell()
    }
    
    func errorWhileFetchingLatLong() {
        let alertController = UIAlertController(title: "And Error Occurred"
            , message: "Unable to get the location of the address selected.\nTry again later :("
            , preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
        
        userInterface?.showAlert(alertController)
    }
}
