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

        let initialFlow = NBOLogInCoordinator(withViewController: window.rootViewController!)
        initialFlow.coordinatorDelegate = self
        self.pushCoordinator(initialFlow)
    }
}

extension NBOApplicationCoordinator: NBOLoginCoordinatorDelegate {

    func nboLoginCoordinatorDidFinish(_ coordinator: NBOLogInCoordinator) {
        popCoordinator(coordinator)
        let newFlow = NBOUserProgressCoordinator(withViewController: presentingViewController)
        self.pushCoordinator(newFlow)
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
        
    }
    
    func userProgressCoordinatorDidSignOut(_ coordinator: NBOUserProgressCoordinator) {
        
    }
}
