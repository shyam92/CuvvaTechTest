//
//  HomeViewController.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 01/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel(delegate: self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor(named: "Secondary CTA")?.withAlphaComponent(0.05)
    }

}

extension HomeViewController: HomeViewDelegate {
    func didReceiveData(from apiSource: ViewModelSource) {
        tableView.reloadData()
    }
    
    func didReceiveError(from apiSource: ViewModelSource, error: Error) {
        
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.dataSource.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dataSource[section].count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Vehicles", for: indexPath) as? VehicleTableViewCell else {
            return UITableViewCell()
        }
        guard let data = viewModel?.dataSource[indexPath.section][indexPath.row] else {
            return cell
        }
        cell.setup(with: data, isActive: indexPath.section == 0)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Header") as? HeaderTableViewCell
        cell?.headerTitleLabel.text = section == 0 ? "Active policies" : "Vehicles"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section > 0 {
            return 132
        }
        return 158
    }
}
