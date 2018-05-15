//
//  HomeViewController.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

import UIKit
import GooglePlaces

class HomeViewController: UIViewController {

    @IBOutlet weak var searchBar    : UISearchBar!
    @IBOutlet weak var tableView    : UITableView!
    
    var eventHandler                : HomeModuleInterface?
    var autocompleteResults         = [GMSAutocompletePrediction]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = HomePresenter(userInterface: self)
        eventHandler?.viewDidLoad()
    }
}


// MARK: HomeViewInterface

extension HomeViewController: HomeViewInterface {
    func setupSearchbarWithDelegate(_ searchBarDelegate: UISearchBarDelegate) {
        searchBar.delegate =  searchBarDelegate
    }
    
    func updateTableVieWithAutocompleteResults(_ autocompleteResults: [GMSAutocompletePrediction]) {
        self.autocompleteResults = autocompleteResults
        tableView.reloadData()
    }
}


// MARK: UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autocompleteResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELLS_IDENTIFIERS.HOME_VIEW_CONTROLLER.ADDRESS_RESULT_CELL, for: indexPath) as! AddressResultCell
        cell.addressResult = autocompleteResults[indexPath.row]
        
        return cell
    }
}


// MARK: UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventHandler?.cellWasSelectedWithAddress(autocompleteResults[indexPath.row])
    }
}
