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

// MARK: NBOLoginCoordinatorDelegate

extension NBOApplicationCoordinator: NBOLoginCoordinatorDelegate {

    func nboLoginCoordinatorDidFinish(_ coordinator: NBOLogInCoordinator, player: NBOPlayer) {
        // TODO: set player id from logged in user
        AppContext.shared.currentUserId.set(newValue: 2)
        NBOUserProgressService.getOfficesByPlayerId(idPlayer: player.id, success: { (playerOfficeProgressList) in
            self.startUserProgressCoordinatorWithOfficeList(playerOfficeProgressList)
        }) { (error) in
            print(error)
        }
    }
}

// MARK: Add User progress functionality

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

        let nboActivitiesCoordinator = NBOActivitiesFlowCoordinator(withViewController: presentingViewController)
        nboActivitiesCoordinator.coordinatorDelegate = self
        nboActivitiesCoordinator.selectedCategoryOffice = selectedCategoryOffice
        self.pushCoordinator(nboActivitiesCoordinator)
    }
    
    func userProgressCoordinatorDidSignOut(_ coordinator: NBOUserProgressCoordinator) {
        // TODO: handle sign out
    }
}
