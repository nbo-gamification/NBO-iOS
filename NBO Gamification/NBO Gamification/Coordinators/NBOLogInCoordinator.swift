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
    func nboLoginCoordinatorDidFinish(_ coordinator: NBOLogInCoordinator, playerOfficeProgressList: [NBOPlayerOfficeProgress])
}

class NBOLogInCoordinator : NBOCoordinator {

    var coordinatorDelegate: NBOLoginCoordinatorDelegate? = nil

    override func start() {

        let loginVC = NBOLoginViewController()
        // This is going to be used when we remember email and password
        loginVC.viewData = NBOLoginViewController.ViewData(email: "", pass: "")
        loginVC.delegate = self
        self.pushViewController(loginVC)
    }
}

extension NBOLogInCoordinator: NBOLoginViewControllerDelegate {
    func viewControllerDidSignIn(_ loginVC: NBOLoginViewController, email: String, password: String) {
        NBOAuthenticationService.login(email: email, password: password, success: {authenticationLoginResponse in

            let playerOfficeProgressList = authenticationLoginResponse.playerOfficeProgressList
            self.coordinatorDelegate?.nboLoginCoordinatorDidFinish(self, playerOfficeProgressList: playerOfficeProgressList)
        }, failure: {error in
            print(error)
            loginVC.showEmailErrorMessageAnimated(errorToShow: NBOLoginViewController.ErrorMessages.incorrectEmailOrPassword)
        })
    }


}
