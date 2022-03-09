//
//  SportsListViewController.swift
//  SportsList
//
//  Created by shikha on 07/03/22.
//

import UIKit

class SportsListViewController: UIViewController {
    
    lazy var viewModel = {
        SportsViewModel(sportService: SportsServiceFactory.create())
    }()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareUI()
        initViewModel()
    }
    
    func initViewModel() {
        viewModel.getSportsList()
        
        // Reload TableView closure
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    func prepareUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .black
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()

        tableView.register(SportsListViewCell.nib, forCellReuseIdentifier: SportsListViewCell.identifier)
    }

}
// MARK: - UITableViewDelegate

extension SportsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

// MARK: - UITableViewDataSource

extension SportsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sportCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SportsListViewCell.identifier, for: indexPath) as? SportsListViewCell else { fatalError("xib does not exists") }
        let dataProvider = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewdataProviderModel = dataProvider
        return cell
    }
    
}

