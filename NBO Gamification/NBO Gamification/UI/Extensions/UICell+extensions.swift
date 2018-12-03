//
//  UICell+extensions.swift
//  NBO Gamification
//
//  Created by facundop on 03/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

protocol CellIdentifier {
    static var cellIdentifier: String { get }
}

extension CellIdentifier {
    static var cellIdentifier: String {
        get {
            let className = String(describing: self)
            if let last = className.components(separatedBy: ".").last {
                return last
            } else {
                return className
            }
        }
    }
}

extension UITableViewCell: CellIdentifier {}
extension UITableViewHeaderFooterView: CellIdentifier {}
