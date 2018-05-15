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
    var tableViewStatus             = HomeTableTypeEnum.EMPTY
    
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
        
        let sender = sender as! ((String, String), String)
        let productListVC = segue.destination as! ProductListViewController
        
        productListVC.fullAddressText = sender.1
        productListVC.tupleLatLong = sender.0
    }
}


// MARK: HomeViewInterface

extension HomeViewController: HomeViewInterface {
    func setupSearchbarWithDelegate(_ searchBarDelegate: UISearchBarDelegate) {
        searchBar.delegate =  searchBarDelegate
    }
    
    func updateTableVieWithAutocompleteResults(_ autocompleteResults: [GMSAutocompletePrediction]) {
        self.autocompleteResults = autocompleteResults
        self.tableViewStatus = HomeTableTypeEnum.ACTIVE
        tableView.reloadData()
    }
    
    func presentProductListScreenWithLatLong(_ tupleLatLong: (String, String), fullAddressText: String) {
        performSegue(withIdentifier: SEGUE_IDENTIFIERS.HOME.TO_PRODUCT_LIST, sender: (tupleLatLong, fullAddressText))
    }
    
    func showEmptyResultsCell() {
        self.autocompleteResults = [GMSAutocompletePrediction]()
        self.tableViewStatus = HomeTableTypeEnum.EMPTY
        tableView.reloadData()
    }
    
    func showFetchingErrorCell() {
        self.autocompleteResults = [GMSAutocompletePrediction]()
        self.tableViewStatus = HomeTableTypeEnum.ERROR
        tableView.reloadData()
    }
    
    func showAlert(_ alertController: UIAlertController) {
        present(alertController, animated: true, completion: nil)
    }
}


// MARK: UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard tableViewStatus == HomeTableTypeEnum.ACTIVE else {
            return 1
        }
        
        return autocompleteResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableViewStatus {
            
        case HomeTableTypeEnum.ACTIVE:
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIERS.HOME.ADDRESS_RESULT_CELL, for: indexPath) as! AddressResultCell
            cell.addressResult = autocompleteResults[indexPath.row]
            
            return cell
            
        case HomeTableTypeEnum.EMPTY:
            return tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIERS.HOME.EMPTY_RESULT_CELL, for: indexPath)
            
        case HomeTableTypeEnum.ERROR:
            return tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIERS.HOME.ERROR_RESULT_CELL, for: indexPath)
        }
    }
}


// MARK: UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventHandler?.cellWasSelectedWithAddress(autocompleteResults[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
