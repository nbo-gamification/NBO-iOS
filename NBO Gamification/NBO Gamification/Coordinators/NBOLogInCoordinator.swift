//
//  NBOLogInCoordinator.swift
//  NBO Gamification
//
//  Created by facundop on 17/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit
import Foundation

protocol NBOLoginCoordinatorDelegate {
    func nboLoginCoordinatorDidFinish(_ coordinator: NBOLogInCoordinator)
}

class NBOLogInCoordinator : NBOCoordinator {

    var coordinatorDelegate: NBOLoginCoordinatorDelegate? = nil

    override func start() {

        let susiVC = NBOLoginViewController()
        susiVC.delegate = self
        self.pushViewController(susiVC)
    }
}

extension NBOLogInCoordinator: NBOLoginViewControllerDelegate {
    func viewControllerDidSignIn(_ NBOsusiVC: NBOLoginViewController) {
        coordinatorDelegate?.nboLoginCoordinatorDidFinish(self)
    }


}
