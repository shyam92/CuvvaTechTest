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
        // Send alert
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
        guard let viewModel = viewModel,
            let cell = tableView.dequeueReusableCell(withIdentifier: "Vehicles", for: indexPath) as? VehicleTableViewCell else {
            return UITableViewCell()
        }
        let data = viewModel.dataSource[indexPath.section][indexPath.row]
        let isActive = indexPath.section == 0 && viewModel.dataSource.count > 1
        cell.setup(with: data, isActive: isActive, activePolicy: viewModel.getActivePolicy(from: data))
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let viewModel = viewModel else { return nil }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Header") as? HeaderTableViewCell
        let isActive = section == 0 && viewModel.dataSource.count > 1
        cell?.headerTitleLabel.text = isActive ? "Active policies" : "Vehicles"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let viewModel = viewModel else { return 132 }
        let isActive = indexPath.section == 0 && viewModel.dataSource.count > 1
        if isActive {
            return 158
        }
        return 132
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = viewModel?.dataSource[indexPath.section][indexPath.row] else {
            return
        }
        
        if let policyViewController = storyboard?.instantiateViewController(withIdentifier: "PolicyViewController") as? PolicyViewController {
            let viewModel = PolicyViewModel(with: data)
            policyViewController.viewModel = viewModel
            policyViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(policyViewController, animated: true, completion: nil)
        }
        
    }
}
