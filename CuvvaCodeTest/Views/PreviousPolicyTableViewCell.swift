//
//  PreviousPolicyTableViewCell.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 03/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import UIKit

class PreviousPolicyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    

    func setup(with policy: Policy) {
        // Start date of end label
        guard let startDate = policy.startDate, let endDate = policy.endDate else { return }
        // Get duration of policy
        
        let duration = startDate.getMinsTo(date: endDate)
        // Just converting to mins
        durationLabel.text = "\(duration) minutes"
        
        
        // Check if void
        if policy.isVoid {
            durationLabel.text = "Voided"
            durationLabel.textColor = UIColor(named: "Alert")
        }
        
        startDateLabel.text = startDate.toString()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        durationLabel.textColor = UIColor(named: "Dark Indigo")
        durationLabel.text = nil
        startDateLabel.text = nil
    }
}
