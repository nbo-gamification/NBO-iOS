//
//  NBOConnectActivityCoordinator.swift
//  NBO Gamification
//
//  Created by dante on 02/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

class NBOConnectActivityCoordinator: NBOActivityCoordinator {
    
    var activity: NBOConnectActivity?
    
    override func start() {
        let connectVC = NBOConnectActivityViewController()
        connectVC.delegate = self
        fillActivityData(connectVC: connectVC, activityData: activity)

        viewController = connectVC
        super.start()
    }

    func fillActivityData(connectVC: NBOConnectActivityViewController, activityData: NBOConnectActivity?) {
        guard let activityData = activityData else { return }
        if connectVC.viewData == nil {
            connectVC.viewData = NBOConnectActivityViewController.ViewData(activityData: activityData)
        } else {
            connectVC.viewData?.connectActivity = activityData
        }
    }
}

// MARK: ConnectActivityViewControllerDelegate

extension NBOConnectActivityCoordinator: NBOActivityViewControllerDelegate {
    func viewControllerDidExit(_ activityVC: UIViewController) {
        delegate?.activityDidExit(self, completion: nil)
    }
    
    func viewControllerDidSkip(_ activityVC: UIViewController) {
        delegate?.activityDidSkip(self, completion: nil)
    }
    
    func viewControllerDidSelectSubmitButton(_ activityVC: UIViewController, answer: String) {
        let connectVC = activityVC as! NBOConnectActivityViewController
        if answer == connectVC.viewData?.connectActivity?.solutionCode {
            NBOActivitiesService.registerActivityAttempt(result: true, idPlayerCategoryOfficeProgress: NBOMockServiceProviderPlayerCategoryOfficeProgress.progressMendozaSocial.id, success: {categoryOfficeActivityAttempt in
                self.delegate?.activityDidSubmit(self, categoryOfficeActivityAttempt: categoryOfficeActivityAttempt)
            }, failure: {error in
                print(error)
            })
        }
    }
}
