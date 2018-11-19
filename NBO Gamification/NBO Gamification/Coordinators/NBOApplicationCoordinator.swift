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
        
        let initialFlow = NBOUserProgressCoordinator(withViewController: window.rootViewController!)
        self.pushCoordinator(initialFlow)
    }
}
