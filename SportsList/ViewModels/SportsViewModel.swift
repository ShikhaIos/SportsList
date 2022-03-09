//
//  SportsViewModel.swift
//  SportsList
//
//  Created by shikha on 07/03/22.
//

import Foundation

class SportsViewModel: NSObject {
    private var sportService: SportServiceProtocol
    
    var reloadTableView: (() -> Void)?
    
    var sportsData = [SportsData]()
    
    var sportCellViewModels = [SportsCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }

    init(sportService: SportServiceProtocol = SportService()) {
        self.sportService = sportService
    }
    
    ///Method to get the
    ///list of data for sports
    ///by calling the api
    func getSportsList() {
        sportService.getSportsList{ success, model, error in
            if success, let sportsData = model {
                self.fetchData(sportsData: sportsData)
            } else {
                print(error!)
            }
        }
    }
    
    private func fetchData(sportsData: [SportsData]) {
        self.sportsData = sportsData // Cache
        var obj = [SportsCellViewModel]()
        for sports in sportsData {
            obj.append(createCellModel(sports: sports))
        }
        sportCellViewModels = obj
    }
    
    func createCellModel(sports: SportsData) -> SportsCellViewModel {
        let attributes = sports.attributes
        let relationships = sports.relationships
        return SportsCellViewModel(attributes: attributes , relationShips: relationships)

    }
    
    func getCellViewModel(at indexPath: IndexPath) -> SportsCellViewModel {
        return sportCellViewModels[indexPath.row]
    }
}
