//
//  NBOCategorySelectionTableViewCell.swift
//  NBO Gamification
//
//  Created by facundop on 04/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

class NBOCategorySelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryCompletionPercentage: UILabel!
    @IBOutlet weak var categoryCompletionBar: UIView!
    
    @IBOutlet weak var categoryCompletionBarWidth: NSLayoutConstraint!

    var categoryCompletionRatio : Float?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: View configuration
    
    func setCategoryCompletionBarColor() {
        
        let categoryCompletionBarGradientLayer = CAGradientLayer()
        categoryCompletionBarGradientLayer.frame = CGRect(origin: categoryCompletionBar.bounds.origin, size: CGSize(width: categoryCompletionBarMaxSize(), height: categoryCompletionBar.bounds.height))
        categoryCompletionBarGradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.green.cgColor]
        categoryCompletionBarGradientLayer.startPoint = CGPoint(x: 0, y: 1)
        categoryCompletionBarGradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        categoryCompletionBar.layer.addSublayer(categoryCompletionBarGradientLayer)
    }
    
    func updateCategoryCompletionBarWidth() {
    
        let barMaxSize = categoryCompletionBarMaxSize()
        let barSize = barMaxSize * CGFloat(categoryCompletionRatio ?? 0)
      
        self.layoutIfNeeded()
        
        self.categoryCompletionBarWidth.constant = barSize
        UIView.animate(withDuration: 1.5) {
            self.layoutIfNeeded()
        }
    }
    
    func categoryCompletionBarMaxSize() -> CGFloat {
        return self.contentView.frame.width - self.contentView.layoutMargins.left - self.contentView.layoutMargins.right - self.categoryCompletionPercentage.frame.width
    }
}
