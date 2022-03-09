//
//  SportService.swift
//  SportsList
//
//  Created by shikha on 07/03/22.
//

import Foundation

let basedefaultUrl = "https://sports.api.decathlon.com/"

protocol SportServiceProtocol {
    func getSportsList(completion: @escaping (_ success: Bool, _ results: [SportsData]?, _ error: String?) -> ())
}

class SportService: SportServiceProtocol {
    
    func getSportsList(completion: @escaping (Bool, [SportsData]?, String?) -> ()) {
        HttpRequestHelper().GET(url: "\(basedefaultUrl)\("sports")", params: ["": ""], httpHeader: .application_json) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(Sports.self, from: data!)
                        completion(true, model.data, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse sports to model")
                }
            } else {
                completion(false, nil, "Error: sports GET Request failed")
            }
        }
    }
}
