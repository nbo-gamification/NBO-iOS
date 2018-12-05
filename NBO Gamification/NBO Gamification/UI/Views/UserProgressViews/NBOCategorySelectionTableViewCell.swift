//
//  NBOCategorySelectionTableViewCell.swift
//  NBO Gamification
//
//  Created by facundop on 04/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

class NBOCategorySelectionTableViewCell: UITableViewCell {

    var categoryCompletion : Float?
    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryComplitionPercentage: UILabel!
    @IBOutlet weak var categoryCompletionBar: UIView!
    
    
    @IBOutlet weak var categoryCompletionBarTrailingConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func updateConstraints() {
        
        categoryCompletionBarTrailingConstraint.constant
        
        
        super.updateConstraints()
    }
}
