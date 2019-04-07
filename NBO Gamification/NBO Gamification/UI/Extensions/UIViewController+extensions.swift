//
//  UIViewController+extensions.swift
//  NBO Gamification
//
//  Created by dante on 31/03/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

import Foundation
import UIKit

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView: UIView) {
        let spinnerView = UIView.init(frame: UIScreen.main.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center

        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
            spinnerView.layer.zPosition = .greatestFiniteMagnitude
        }

        vSpinner = spinnerView
    }

    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
