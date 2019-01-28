//
//  NBOActivitiesFlowCoordinator.swift
//  NBO Gamification
//
//  Created by facundop on 17/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

class NBOActivitiesFlowCoordinator : NBOCoordinator {
    
    var activityCoordinators = [NBOActivityCoordinator]()
    
    var activitiesToShow: [NBOCategoryOfficeActivity] = []
    var selectedCategoryOffice: NBOPlayerCategoryOfficeProgress?

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
        if self.activitiesToShow.count == 0 {
            // TODO: show message telling there are no activities
            self.coordinatorDelegate?.coordinatorDidFinish(self, completion: nil)
        }
        guard let firstActivity = self.activitiesToShow.first else {return}
        let activityType = firstActivity.activity.type

        switch activityType.typeKeys! {
        case .connect: do {
            let connectCoordinator = NBOConnectActivityCoordinator(withViewController: self.presentingViewController)
            connectCoordinator.coordinatorDelegate = self
            connectCoordinator.activity = firstActivity.activity as? NBOConnectActivity
            activityCoordinators.insert(connectCoordinator, at: 0)
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

    func goToNextActivity(from currentActivityCoordinator: NBOActivityCoordinator, skipped: Bool = false) {
        let currentActivity = self.activitiesToShow.first
        self.activitiesToShow.removeFirst(1)
        if skipped {
            self.activitiesToShow.append(currentActivity!)
        }
        showActivity()
    }
}

// MARK: NBOActivityCoordinatorDelegate

extension NBOActivitiesFlowCoordinator: NBOActivityCoordinatorDelegate {
    func activityDidExit(_ activityCoordinator: NBOActivityCoordinator, completion: (() -> Void)?) {
        for activityCoordinator in activityCoordinators {
            popCoordinator(activityCoordinator, animated: false)
        }
    }
    
    func activityDidSkip(_ activityCoordinator: NBOActivityCoordinator, completion: (() -> Void)?) {
        goToNextActivity(from: activityCoordinator, skipped: true)
    }
    
    func activityDidSubmit(_ activityCoordinator: NBOActivityCoordinator, categoryOfficeActivityAttempt: NBOCategoryOfficeActivityAttempt) {
        if categoryOfficeActivityAttempt.result {
            goToNextActivity(from: activityCoordinator)
        }
    }
}
