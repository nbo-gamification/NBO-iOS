//
//  NBOOfficeSelectionTableViewCell.swift
//  NBO Gamification
//
//  Created by facundop on 03/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

class NBOOfficeSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var officeName: UILabel!
    @IBOutlet weak var officeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
