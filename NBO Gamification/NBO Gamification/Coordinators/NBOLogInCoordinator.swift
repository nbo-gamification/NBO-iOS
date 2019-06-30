//
//  NBOLogInCoordinator.swift
//  NBO Gamification
//
//  Created by facundop on 17/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit
import Foundation

protocol NBOLoginCoordinatorDelegate : CoordinatorDelegate {
    func nboLoginCoordinatorDidFinish(_ coordinator: NBOLogInCoordinator, player: NBOPlayer)
}

class NBOLogInCoordinator : NBOCoordinator {
    
    weak var delegate: NBOLoginCoordinatorDelegate? {
        get { return coordinatorDelegate as? NBOLoginCoordinatorDelegate }
        set { coordinatorDelegate = newValue }
    }
    
    override func start() {

        let loginVC = NBOLoginViewController()
        // This is going to be used when we remember email and password
        loginVC.viewData = NBOLoginViewController.ViewData(email: "", pass: "")
        loginVC.delegate = self

        viewController = loginVC
        super.start()
    }
}

extension NBOLogInCoordinator: NBOLoginViewControllerDelegate {
    func viewControllerDidSignIn(_ loginVC: NBOLoginViewController, email: String, password: String) {
        showSpinner(from: loginVC)
        NBOAuthenticationService.login(email: email, password: password, success:
            { authenticationLoginResponse in
                let player = authenticationLoginResponse
                self.delegate?.coordinatorDidFinish(self, completion: {
                    self.delegate?.nboLoginCoordinatorDidFinish(self, player: player)
                })
                self.hideSpinner(from: loginVC)
        }, failure: {error in
            self.hideSpinner(from: loginVC)
            print(error)
            loginVC.showEmailErrorMessageAnimated(errorToShow: NBOLoginViewController.ErrorMessages.incorrectEmailOrPassword)
        })
    }
}
