//
//  HomeViewInterface.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

import UIKit
import GooglePlaces

protocol HomeViewInterface {
    func setupSearchbarWithDelegate(_ searchBarDelegate: UISearchBarDelegate)
    func updateTableVieWithAutocompleteResults(_ autocompleteResults: [GMSAutocompletePrediction])
    func presentProductListScreenWithLatLong(_ tupleLatLong: (String, String), fullAddressText: String)
    func showEmptyResultsCell()
    func showFetchingErrorCell()
    func showAlert(_ alertController: UIAlertController)
}
