//
//  AppDelegate.swift
//  Beer Lovers
//
//  Created by Thiago Ferrão on 14/05/18.
//

import UIKit
import GooglePlaces
import Apollo

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setupGooglePlacesAPI()
        setupApollo()
        
        return true
    }

    
    // MARK: Private Methods
    
    private func setupGooglePlacesAPI() {
        GMSPlacesClient.provideAPIKey(API_KEYS.GOOGLE_PLACES.KEY)
    }
    
    private func setupApollo() {
        let graphlQLEndpoint = URLS.GRAPHQL_API
        guard let graphlQLEndpointURL = URL(string: graphlQLEndpoint) else {
            return
        }
        
        let apollo = ApolloClient(url: graphlQLEndpointURL)
    }
}
