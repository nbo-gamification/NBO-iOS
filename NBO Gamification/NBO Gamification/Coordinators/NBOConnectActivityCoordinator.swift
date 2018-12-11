//
//  NBOConnectActivityCoordinator.swift
//  NBO Gamification
//
//  Created by dante on 02/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

protocol NBOConnectActivityCoordinatorDelegate {
    func activityDidSubmit(connectActivityCoordinator: NBOConnectActivityCoordinator, categoryOfficeActivityAttempt: NBOCategoryOfficeActivityAttempt)
    func activityDidSkip(connectActivityCoordinator: NBOConnectActivityCoordinator)
}

class NBOConnectActivityCoordinator: NBOCoordinator {

    var coordinatorDelegate: NBOConnectActivityCoordinatorDelegate?
    var activity: NBOConnectActivity?

    override func start() {
        let connectVC = NBOConnectActivityViewController()
        connectVC.delegate = self
        self.fillActivityData(connectVC: connectVC, activityData: activity)
        self.pushViewController(connectVC)
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
extension NBOConnectActivityCoordinator: NBOConnectActivityViewControllerDelegate {
    func viewControllerDidSkip(_ connectVC: NBOConnectActivityViewController) {
        coordinatorDelegate?.activityDidSkip(connectActivityCoordinator: self)
    }

    func viewControllerDidSelectSubmitButton(_ connectVC: NBOConnectActivityViewController, answer: String) {
        if answer == connectVC.viewData?.connectActivity?.solutionCode {
            NBOActivitiesService.registerActivityAttempt(result: true, idPlayerCategoryOfficeProgress: NBOMockServiceProviderPlayerCategoryOfficeProgress.progressMendozaSocial.id, success: {categoryOfficeActivityAttempt in
                self.coordinatorDelegate?.activityDidSubmit(connectActivityCoordinator: self, categoryOfficeActivityAttempt: categoryOfficeActivityAttempt)
            }, failure: {error in
                print(error)
            })
        }
    }


}
