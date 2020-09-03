//
//  PolicyViewController.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 03/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import UIKit

class PolicyViewController: UIViewController {

    var viewModel: PolicyViewModel?
    
    @IBOutlet weak var carMakeLogoImageView: UIImageView!
    @IBOutlet weak var carMakeModelLabel: UILabel!
    @IBOutlet weak var carRegLabel: UILabel!
    @IBOutlet weak var totalPoliciesLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundSpacer: UIView!
    @IBOutlet weak var CTAButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showVehicleDetails()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor(named: "Secondary CTA")?.withAlphaComponent(0.05)
        backgroundSpacer.backgroundColor = UIColor(named: "Secondary CTA")?.withAlphaComponent(0.05)
    }
    
    
    func showVehicleDetails() {
        guard let vehicle = viewModel?.vehicle else {
            closeButtonTapped(true)
            return
        }
        
        let makeString = vehicle.make?.rawValue ?? ""
        carMakeLogoImageView.image = UIImage(named: makeString.lowercased())
        carMakeModelLabel.text = "\(makeString) \(vehicle.model ?? "")"
        carRegLabel.text = vehicle.vrm ?? ""
        totalPoliciesLabel.text = String(vehicle.policies.count)
        
        if viewModel?.hasActivePolicy ?? false {
            CTAButton.backgroundColor = UIColor(named: "Primary CTA")
            CTAButton.setTitle("Extend cover", for: .normal)
            CTAButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            CTAButton.backgroundColor = UIColor(named: "Secondary CTA")?.withAlphaComponent(0.25)
            CTAButton.setTitle("Insure", for: .normal)
            CTAButton.setTitleColor(UIColor(named: "Secondary CTA")?.withAlphaComponent(0.75), for: .normal)
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
extension PolicyViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.policies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.policies[section].count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else { return UITableViewCell() }
        if viewModel.policies.count > 1 && indexPath.section == 0 {
            // Active Policy
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActivePolicy", for: indexPath) as? ActivePolicyTableViewCell else {
                return UITableViewCell()
            }
            let data = viewModel.policies[indexPath.section][indexPath.row]
            cell.delegate = self
            cell.setup(with: data)
            return cell
        }
        // Previous Policies
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousPolicy", for: indexPath) as? PreviousPolicyTableViewCell else {
            return UITableViewCell()
        }
        let data = viewModel.policies[indexPath.section][indexPath.row]
                
        cell.setup(with: data)
        return cell
        
    }
}

extension PolicyViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let viewModel = viewModel else { return nil }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Header") as? HeaderTableViewCell
        let isActive = section == 0 && viewModel.policies.count > 1
        cell?.headerTitleLabel.text =  isActive ? "Active policies" : "Previous driving policies"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = viewModel?.policies[indexPath.section][indexPath.row] else {
            return
        }
        
        moveToReceiptScreen(with: data)
        
    }
    
    private func moveToReceiptScreen(with data: Policy) {

    }
    

}

// Handle Button Press from ActivePolicyDelegate
extension PolicyViewController: ActivePolicyDelegate {
    func tappedPolicyInformation(policy: Policy?) {
        guard let policy = policy else { return }
        moveToReceiptScreen(with: policy)
    }
}
