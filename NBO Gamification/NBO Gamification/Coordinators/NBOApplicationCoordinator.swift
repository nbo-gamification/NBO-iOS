//
//  NBOApplicationCoordinator.swift
//  NBO Gamification
//
//  Created by facundop on 17/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

class NBOApplicationCoordinator : NBOCoordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        
        super.init(withViewController: rootViewController)
    }
    
    override func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()

        let loginCoordinator = NBOLogInCoordinator(withViewController: window.rootViewController!)
        loginCoordinator.coordinatorDelegate = self
        self.pushCoordinator(loginCoordinator)
    }

}

//MARK: NBOLoginCoordinatorDelegate
extension NBOApplicationCoordinator: NBOLoginCoordinatorDelegate {

    func nboLoginCoordinatorDidFinish(_ coordinator: NBOLogInCoordinator, playerOfficeProgressList: [NBOPlayerOfficeProgress]) {
        popCoordinator(coordinator)
        startUserProgressCoordinatorWithOfficeList(playerOfficeProgressList)
    }
}

// Add User progress funcionality
extension NBOApplicationCoordinator {
    func startUserProgressCoordinatorWithOfficeList (_ officeProgressList : [NBOPlayerOfficeProgress]) {
        
        let userProgressFlow = NBOUserProgressCoordinator(withViewController: presentingViewController)
        userProgressFlow.coordinatorDelegate = self
        userProgressFlow.officeProgressList = officeProgressList
        
        self.pushCoordinator(userProgressFlow)
    }
}

extension NBOApplicationCoordinator: NBOUserProgressCoordinatorDelegate {
    func userProgressCoordinatorDidSelectCategory(selectedCategoryOffice: NBOPlayerCategoryOfficeProgress, _ coordinator: NBOUserProgressCoordinator) {

        let nboActivitiesCoordinator = NBOActivitiesCoordinator(withViewController: presentingViewController)
        nboActivitiesCoordinator.coordinatorDelegate = self
        nboActivitiesCoordinator.selectedCategoryOffice = selectedCategoryOffice
        nboActivitiesCoordinator.officeProgressTableVC = presentingViewController.childViewControllers.last
        self.pushCoordinator(nboActivitiesCoordinator)
    }
    
    func userProgressCoordinatorDidSignOut(_ coordinator: NBOUserProgressCoordinator) {
        // TODO: handle sign out
    }
}

