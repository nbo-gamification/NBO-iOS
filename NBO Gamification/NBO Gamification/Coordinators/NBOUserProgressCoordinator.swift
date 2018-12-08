//
//  NBOUserProgressCoordinator.swift
//  NBO Gamification
//
//  Created by facundop on 17/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

protocol NBOUserProgressCoordinatorDelegate {
    func userProgressCoordinatorDidSelectCategory(selectedCategoryOffice: NBOPlayerCategoryOfficeProgress, _ coordinator: NBOUserProgressCoordinator)
    func userProgressCoordinatorDidSignOut(_ coordinator: NBOUserProgressCoordinator)
}

class NBOUserProgressCoordinator : NBOCoordinator {
    
    var coordinatorDelegate: NBOUserProgressCoordinatorDelegate? = nil
    var officeProgressList : [NBOPlayerOfficeProgress]?
    
    override func start() {
        let officeSelectionVC = NBOOfficeSelectionTableViewController()
        
        officeSelectionVC.title = "Select Office"
        
        officeSelectionVC.delegate = self
        officeSelectionVC.officeProgressList = officeProgressList ?? []
        
        pushViewController(officeSelectionVC)
    }
}

extension NBOUserProgressCoordinator : NBOOfficeSelectionViewControllerDelegate {
    func nboOfficeSelectionViewControllerDidSelectOffice (selectedOfficeProgress : NBOPlayerOfficeProgress, _ NBOOfficeSelectionVC: NBOOfficeSelectionTableViewController) {
        
        NBOUserProgressService.selectOffice(idPlayerOfficeProgress: selectedOfficeProgress.id, success: { (playerCategoryOfficeProgressList) in
            
            let categorySelectionVC = NBOUserOfficeProgressTableViewController()
            
            categorySelectionVC.title = "Choose a category"
            
            categorySelectionVC.delegate = self
            categorySelectionVC.categoryOfficeProgressList = playerCategoryOfficeProgressList
            
            self.pushViewController(categorySelectionVC)
        
        }) { (error) in
            // TODO: handle error in service call
            print(error.localizedDescription)
        }
    }
}

extension NBOUserProgressCoordinator : NBOUserOfficeProgressViewControllerDelegate {
    func userOfficeProgressViewControllerDidSelectCategoryOfficeProgress(selectedCategoryOffice: NBOPlayerCategoryOfficeProgress, _ NBOUserOfficeProgressVC: NBOUserOfficeProgressTableViewController) {
        coordinatorDelegate?.userProgressCoordinatorDidSelectCategory(selectedCategoryOffice: selectedCategoryOffice, self)
    }
}
