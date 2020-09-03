//
//  HeaderTableViewCell.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 03/09/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        headerTitleLabel.textColor = UIColor(named: "Grey")
        self.backgroundColor = UIColor(named: "Secondary CTA")?.withAlphaComponent(0.05)
    }
    
    

}
