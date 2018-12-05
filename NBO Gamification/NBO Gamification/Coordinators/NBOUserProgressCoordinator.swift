//
//  NBOUserProgressCoordinator.swift
//  NBO Gamification
//
//  Created by facundop on 17/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

protocol NBOUserProgressCoordinatorDelegate {
    func nboUserProgressCoordinatorDidSelectCategory(_ coordinator: NBOUserProgressCoordinator)
    func nboUserProgressCoordinatorDidSignOut(_ coordinator: NBOUserProgressCoordinator)
}

class NBOUserProgressCoordinator : NBOCoordinator {
    
    var coordinatorDelegate: NBOUserProgressCoordinatorDelegate? = nil
    var officeList : [NBOOffice]?
    
    override func start() {
        let officeSelectionVC = NBOOfficeSelectionTableViewController()
        
        officeSelectionVC.title = "Select Office"
        
        officeSelectionVC.delegate = self
        officeSelectionVC.officeList = officeList ?? []
        
        pushViewController(officeSelectionVC)
    }
}

extension NBOUserProgressCoordinator: NBOOfficeSelectionViewControllerDelegate {
    func nboOfficeSelectionViewControllerDidSelectOffice (selectedOffice : NBOOffice, _ NBOOfficeSelectionVC: NBOOfficeSelectionTableViewController) {
        
    }
}
