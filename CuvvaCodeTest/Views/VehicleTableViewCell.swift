//
//  VehicleTableViewCell.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 03/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import UIKit

class VehicleTableViewCell: UITableViewCell {

    @IBOutlet weak var carLogoImageView: UIImageView!
    @IBOutlet weak var carMakeTitleLabel: UILabel!
    @IBOutlet weak var carDescriptionLabel: UILabel!
    @IBOutlet weak var regPlateLabel: UILabel!
    @IBOutlet weak var totalPoliciesLabel: UILabel!
    
    @IBOutlet weak var CTAButton: UIButton!
    
    @IBOutlet weak var policyTimeRemainingLabel: UILabel!
    @IBOutlet weak var policyTimeRemainingHeighConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()        
        self.backgroundColor = UIColor(named: "Secondary CTA")?.withAlphaComponent(0.05)
    }

    func setup(with vehicle: Vehicle, isActive: Bool, activePolicy: Policy? = nil) {
        let makeString = vehicle.make?.rawValue ?? ""
        carLogoImageView.image = UIImage(named: makeString.lowercased())
        carMakeTitleLabel.text = makeString
        carDescriptionLabel.text = "\(vehicle.color?.rawValue ?? "") \(vehicle.model ?? "")"
        regPlateLabel.text = vehicle.vrm ?? ""
        totalPoliciesLabel.text = String(vehicle.policies.count)
        CTAButton.backgroundColor = UIColor(named: "Secondary CTA")?.withAlphaComponent(0.05)
        CTAButton.setTitle("Insure", for: .normal)
        CTAButton.setTitleColor(UIColor(named: "Secondary CTA")?.withAlphaComponent(0.75), for: .normal)
        
        policyTimeRemainingHeighConstraint.constant = 0
        
        if isActive, let policy = activePolicy {
            policyTimeRemainingHeighConstraint.constant = 32
            CTAButton.backgroundColor = UIColor(named: "Primary CTA")
            CTAButton.setTitle("Extend", for: .normal)
            CTAButton.setTitleColor(UIColor.white, for: .normal)
            guard let endDate = policy.endDate else { return }
            let minsLeft = Date().getMinsTo(date: endDate)
            policyTimeRemainingLabel.text = "\(minsLeft) minutes remaining"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        CTAButton.backgroundColor = UIColor(named: "Secondary CTA")?.withAlphaComponent(0.05)
        CTAButton.setTitle("Insure", for: .normal)
        CTAButton.setTitleColor(UIColor(named: "Secondary CTA")?.withAlphaComponent(0.75), for: .normal)
        carLogoImageView.image = nil
        carMakeTitleLabel.text = nil
        carDescriptionLabel.text = nil
        regPlateLabel.text = nil
        totalPoliciesLabel.text = nil
    }

}
