//
//  NBOTriviaAcitivityCoordinator.swift
//  NBO Gamification
//
//  Created by dante on 02/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

class NBOTriviaActivityCoordinator: NBOCoordinator {

    override func start() {
        let triviaVC = NBOTriviaActivityViewController()
        
        viewController = triviaVC
        super.start()
    }
}
