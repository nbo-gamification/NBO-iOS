//
//  NBOUserOfficeProgressTableViewController.swift
//  NBO Gamification
//
//  Created by facundop on 04/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

protocol NBOUserOfficeProgressViewControllerDelegate {
    func userOfficeProgressViewControllerDidSelectCategoryOfficeProgress (selectedCategoryOffice : NBOPlayerCategoryOfficeProgress, _ NBOUserOfficeProgressVC: NBOUserOfficeProgressTableViewController)
}

class NBOUserOfficeProgressTableViewController: UITableViewController {
    
    var delegate: NBOUserOfficeProgressViewControllerDelegate?
    var categoryOfficeProgressList : [NBOPlayerCategoryOfficeProgress] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: NBOCategorySelectionTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: NBOCategorySelectionTableViewCell.cellIdentifier)
    }
    
    // MARK: Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryOfficeProgressList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NBOCategorySelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: NBOCategorySelectionTableViewCell.cellIdentifier) as! NBOCategorySelectionTableViewCell

        let categoryOfficeProgress = categoryOfficeProgressList[indexPath.row]
        
        let categoryPoints = categoryOfficeProgress.totalPoints
        let categoryTotalPoints = categoryOfficeProgress.categoryOffice.totalPointsRequired
        
        cell.categoryName?.text = categoryOfficeProgress.categoryOffice.category.name
        cell.categoryCompletionPercentage?.text = userProgressHelper.calculateCompletionPercentage(points: categoryPoints, totalPoints: categoryTotalPoints)
        cell.categoryCompletionRatio = userProgressHelper.calculateCompletionRatio(points: categoryPoints, totalPoints: categoryTotalPoints)
                
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell : NBOCategorySelectionTableViewCell = cell as! NBOCategorySelectionTableViewCell
        cell.setCategoryCompletionBarColor()
        cell.updateCategoryCompletionBarWidth()
    }
 
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.userOfficeProgressViewControllerDidSelectCategoryOfficeProgress(selectedCategoryOffice: categoryOfficeProgressList[indexPath.row], self)
    }
}
