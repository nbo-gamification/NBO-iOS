//
//  NBOUserProgressCoordinator.swift
//  NBO Gamification
//
//  Created by facundop on 17/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

protocol NBOUserProgressCoordinatorDelegate : CoordinatorDelegate {
    func userProgressCoordinatorDidSelectCategory(selectedCategoryOffice: NBOPlayerCategoryOfficeProgress, _ coordinator: NBOUserProgressCoordinator)
    func userProgressCoordinatorDidSignOut(_ coordinator: NBOUserProgressCoordinator)
}

class NBOUserProgressCoordinator : NBOCoordinator {
    
    weak var delegate: NBOUserProgressCoordinatorDelegate? {
        get { return coordinatorDelegate as? NBOUserProgressCoordinatorDelegate }
        set { coordinatorDelegate = newValue }
    }
    
    override func start() {
        let officeSelectionVC = NBOOfficeSelectionTableViewController()
        officeSelectionVC.title = "Select Office"
        officeSelectionVC.delegate = self
        viewController = officeSelectionVC

        NBOUserProgressService.getOfficesByPlayerId(idPlayer: AppContext.shared.currentUserId.get(), success: { (playerOfficeProgressList) in
            officeSelectionVC.officeProgressList = playerOfficeProgressList
        }) { (error) in
            print(error)
        }

        super.start()
    }
}

extension NBOUserProgressCoordinator : NBOOfficeSelectionViewControllerDelegate {
    func nboOfficeSelectionViewControllerDidSelectOffice (selectedOfficeProgress : NBOPlayerOfficeProgress, _ NBOOfficeSelectionVC: NBOOfficeSelectionTableViewController) {
        
        NBOUserProgressService.selectOffice(idPlayerOfficeProgress: selectedOfficeProgress.id, success: { (playerCategoryOfficeProgressList) in
            
            let categorySelectionVC = NBOUserOfficeProgressTableViewController()
            
            categorySelectionVC.title = "Choose a category"
            
            categorySelectionVC.delegate = self
            categorySelectionVC.categoryOfficeProgressList = playerCategoryOfficeProgressList
            
            self.viewController = categorySelectionVC
            self.pushViewController(categorySelectionVC)
        
        }) { (error) in
            // TODO: handle error in service call
            print(error)
        }
    }
}

extension NBOUserProgressCoordinator : NBOUserOfficeProgressViewControllerDelegate {
    func userOfficeProgressViewControllerDidSelectCategoryOfficeProgress(selectedCategoryOffice: NBOPlayerCategoryOfficeProgress, _ NBOUserOfficeProgressVC: NBOUserOfficeProgressTableViewController) {
        delegate?.userProgressCoordinatorDidSelectCategory(selectedCategoryOffice: selectedCategoryOffice, self)
    }
}
