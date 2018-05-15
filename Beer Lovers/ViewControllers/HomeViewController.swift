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
    
    
    // MARK: SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard (segue.identifier == SEGUE_IDENTIFIERS.HOME.TO_PRODUCT_LIST) else {
            print("[HomeViewController] Unknown segue identifier was triggered")
            return
        }
        
        let tupleLatLong = sender as! (String, String)
        let productListVC = segue.destination as! ProductListViewController
        
        productListVC.tupleLatLong = tupleLatLong
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
    
    func presentProductListScreenWithLatLong(_ tupleLatLong: (String, String)) {
        performSegue(withIdentifier: SEGUE_IDENTIFIERS.HOME.TO_PRODUCT_LIST, sender: tupleLatLong)
    }
}


// MARK: UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autocompleteResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIERS.HOME.ADDRESS_RESULT_CELL, for: indexPath) as! AddressResultCell
        cell.addressResult = autocompleteResults[indexPath.row]
        
        return cell
    }
}


// MARK: UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventHandler?.cellWasSelectedWithAddress(autocompleteResults[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
