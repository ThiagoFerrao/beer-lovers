//
//  HomeViewController.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchBar    : UISearchBar!
    @IBOutlet weak var tableView    : UITableView!
    
    var eventHandler                : HomeModuleInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = HomePresenter(userInterface: self)
        eventHandler?.viewDidLoad()
    }
}


// MARK: HomeViewInterface

extension HomeViewController: HomeViewInterface {
    func setupSearchbar() {
        
    }
}


// MARK: UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


// MARK: UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
