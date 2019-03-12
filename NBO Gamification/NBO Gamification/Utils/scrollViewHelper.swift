//
//  scrollViewHelper.swift
//  NBO Gamification
//
//  Created by dante on 26/01/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

import Foundation
import UIKit

class ScrollViewHelper {

    public static func getKeyboardSize(notification: NSNotification, view: UIView) -> CGFloat {
        let userInfo = notification.userInfo!

        let keyboardScreenBeginFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

        let keyboardViewBeginFrame = view.convert(keyboardScreenBeginFrame, from: view.window)
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        let originDelta = keyboardViewEndFrame.origin.y - keyboardViewBeginFrame.origin.y

        return -originDelta
    }
}


