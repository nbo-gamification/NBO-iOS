//
//  NBOActivitiesCoordinator.swift
//  NBO Gamification
//
//  Created by facundop on 17/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

class NBOActivitiesCoordinator : NBOCoordinator {

    var selectedCategoryOffice: NBOPlayerCategoryOfficeProgress?
    var coordinatorDelegate: NBOApplicationCoordinator?
    var activitiesToShow: [NBOCategoryOfficeActivity] = []
    var officeProgressTableVC: UIViewController?

    override func start() {
        getActivities(categoryOfficeIdSelected: selectedCategoryOffice?.id)
    }

    func getActivities(categoryOfficeIdSelected: Int?) {
        guard let categoryOfficeIdSelected = categoryOfficeIdSelected else {return}
        NBOActivitiesService.getOfficeActivitiesForCategory(idCategoryOffice: categoryOfficeIdSelected, success:
            {categoryOfficeActivityList in
                self.activitiesToShow = categoryOfficeActivityList
                self.showActivity()
        }, failure: {error in
            print(error)
        })
    }

    func showActivity() {
        guard let firstActivity = self.activitiesToShow.first else {return}
        let activityType = firstActivity.activity.type

        switch activityType.typeKeys! {
        case .connect: do {
            let connectCoordinator = NBOConnectActivityCoordinator(withViewController: self.presentingViewController)
            connectCoordinator.coordinatorDelegate = self
            connectCoordinator.activity = firstActivity.activity as? NBOConnectActivity
            self.pushCoordinator(connectCoordinator)
            }
        case .trivia: do {
            print("Not implemented yet")
            }
        case .productCheck: do {
            print("Not implemented yet")
            }
        }
    }

    func showNewActivity(connectActivityCoordinator: NBOConnectActivityCoordinator, skiped: Bool = false) {
        popCoordinator(connectActivityCoordinator)
        if skiped {
            let firstActivity = self.activitiesToShow.first
            self.activitiesToShow.removeFirst(1)
            self.activitiesToShow.append(firstActivity!)
        } else {
            self.activitiesToShow.removeFirst(1)
            if self.activitiesToShow.count == 0 {
                popCoordinator(self)
                popViewController(officeProgressTableVC)
                return
            }
        }
        showActivity()
    }
}


//MARK:NBOConnectActivityCoordinatorDelegate
extension NBOActivitiesCoordinator: NBOConnectActivityCoordinatorDelegate {
    func activityDidSkip(connectActivityCoordinator: NBOConnectActivityCoordinator) {
        showNewActivity(connectActivityCoordinator: connectActivityCoordinator, skiped: true)
    }


    func activityDidSubmit(connectActivityCoordinator: NBOConnectActivityCoordinator, categoryOfficeActivityAttempt: NBOCategoryOfficeActivityAttempt) {
        if categoryOfficeActivityAttempt.result {
            showNewActivity(connectActivityCoordinator: connectActivityCoordinator)
        }
    }
}
