//
//  SportsServiceFactory.swift
//  SportsList
//
//  Created by shikha on 08/03/22.
//

import Foundation

//Added this class for future to handle webservices in test environment

class SportsServiceFactory {
    
    static func create()  -> SportServiceProtocol {
        let environment = ProcessInfo.processInfo.environment["ENV"]
        
        if let environment = environment {
            if environment == "TEST" {
                return MockSportsService()
            } else{
                return SportService()
            }
        }
        else {
            return SportService()
        }
    }
}
