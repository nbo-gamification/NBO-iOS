//
//  NBOActivityCoordinator.swift
//  NBO Gamification
//
//  Created by facundop on 17/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

protocol NBOActivityCoordinatorDelegate : CoordinatorDelegate {
    func activityDidExit(_ activityCoordinator: NBOActivityCoordinator, completion: (() -> Void)?)
    func activityDidSkip(_ activityCoordinator: NBOActivityCoordinator, completion: (() -> Void)?)
    func activityDidSubmit(_ activityCoordinator: NBOActivityCoordinator, categoryOfficeActivityAttempt: NBOCategoryOfficeActivityAttempt)
}

class NBOActivityCoordinator: NBOCoordinator {
    
    weak var delegate: NBOActivityCoordinatorDelegate? {
        get { return coordinatorDelegate as? NBOActivityCoordinatorDelegate }
        set { coordinatorDelegate = newValue }
    }
}
