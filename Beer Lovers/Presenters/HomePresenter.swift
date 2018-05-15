//
//  HomePresenter.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

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
        userInterface?.setupSearchbar()
    }
}
