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
        
        NBOUserProgressService.selectOffice(idPlayerOfficeProgress: selectedOfficeProgress.id, success: { (playerCategoryOfficeProgressCodableList) in
            
            var playerCategoryOfficeProgressList : [NBOPlayerCategoryOfficeProgress] = []
            
            for playerCategoryOfficeProgressCodable in playerCategoryOfficeProgressCodableList {
                
                if let playerCategoryOfficeProgressCodableId = playerCategoryOfficeProgressCodable.id,
                    let playerCategoryOfficeProgressCodableTotalPoints = playerCategoryOfficeProgressCodable.totalPoints,
                    
                    let categoryOfficeCodable = playerCategoryOfficeProgressCodable.categoryOffice,
                    let categoryOfficeCodableIsActive = categoryOfficeCodable.isActive,
                    categoryOfficeCodableIsActive, // Only continue if the category office is active
                    let categoryOfficeCodableId = categoryOfficeCodable.id,
                    let categoryOfficeCodableTotalPointsRequired = categoryOfficeCodable.totalPointsRequired,
                    
                    let officeCodable = categoryOfficeCodable.office,
                    let officeCodableId = officeCodable.id,
                    let officeCodableName = officeCodable.name,
                    
                    let categoryCodable = categoryOfficeCodable.category,
                    let categoryCodableId = categoryCodable.id,
                    let categoryCodableName = categoryCodable.name {
                    
                    let office = NBOOffice(id: officeCodableId, name: officeCodableName)
                    let category = NBOCategory(id: categoryCodableId, name: categoryCodableName)
                    category.description = categoryCodable.description ?? ""
                    
                    let categoryOffice = NBOCategoryOffice(id: categoryOfficeCodableId, totalPointsRequired: categoryOfficeCodableTotalPointsRequired, isActive: categoryOfficeCodableIsActive, office: office, category: category)
                    
                    let playerCategoryOfficeProgress = NBOPlayerCategoryOfficeProgress(id: playerCategoryOfficeProgressCodableId, totalPoints: playerCategoryOfficeProgressCodableTotalPoints, categoryOffice: categoryOffice)
                    
                    playerCategoryOfficeProgressList.append(playerCategoryOfficeProgress)
                }
            }
            
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
