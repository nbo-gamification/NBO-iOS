//
//  NBOUserProgressCoordinator.swift
//  NBO Gamification
//
//  Created by facundop on 17/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

class NBOUserProgressCoordinator : NBOCoordinator {
    
    override func start() {
        let userOfficeProgressVC = NBOUserOfficeProgressViewController()
        
        self.pushViewController(userOfficeProgressVC)
    }
}
