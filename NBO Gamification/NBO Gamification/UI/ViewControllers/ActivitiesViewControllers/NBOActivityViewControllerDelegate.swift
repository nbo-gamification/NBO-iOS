//
//  NBOActivityViewControllerDelegate.swift
//  NBO Gamification
//
//  Created by facundop on 17/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

protocol NBOActivityViewControllerDelegate: class {
    func viewControllerDidExit(_ activityVC: UIViewController)
    func viewControllerDidSkip(_ activityVC: UIViewController)
    func viewControllerDidSelectSubmitButton(_ activityVC: UIViewController, answer: String)
}
