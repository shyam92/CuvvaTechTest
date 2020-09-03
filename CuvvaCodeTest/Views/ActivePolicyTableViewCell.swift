//
//  ActivePolicyTableViewCell.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 03/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import UIKit

protocol ActivePolicyDelegate: class {
    func tappedPolicyInformation(policy: Policy?)
}

class ActivePolicyTableViewCell: UITableViewCell {

    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var policyButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    
    weak var delegate: ActivePolicyDelegate?
    var policy: Policy?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        policyButton.backgroundColor = UIColor(named: "Secondary CTA")?.withAlphaComponent(0.05)
        helpButton.backgroundColor = UIColor(named: "Secondary CTA")?.withAlphaComponent(0.05)
    }
        
    @IBAction func policyInformationTapped(_ sender: Any) {
        delegate?.tappedPolicyInformation(policy: policy)
    }
    
    func setup(with policy: Policy) {
        guard let endDate = policy.endDate else { return }
        let minsLeft = Date().getMinsTo(date: endDate)
        timeRemainingLabel.text = "\(minsLeft) mins remaining"
        self.policy = policy
    }
    
}
