//
//  HomePresenter.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

import UIKit
import Foundation

class HomePresenter: NSObject {
    
    var userInterface   : HomeViewInterface?
    
    init(userInterface: HomeViewInterface) {
        super.init()
        
        self.userInterface = userInterface
    }
}


// MARK: HomeModuleInterface

extension HomePresenter: HomeModuleInterface {
    func viewDidLoad() {
        userInterface?.setupSearchbarWithDelegate(self)
    }
}


// MARK: UISearchBarDelegate

extension HomePresenter: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
