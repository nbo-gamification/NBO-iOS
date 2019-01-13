//
//  ScrollView+Extensions.swift
//  NBO Gamification
//
//  Created by dante on 26/01/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    public func adjustBottomScrollInstestsAndPosition(bottomIndicatorInsets: CGFloat, bottomContentInsets: CGFloat, shouldScrollToPosition: CGPoint?, scrollingAnimated: Bool? = true) {

        self.scrollIndicatorInsets.bottom = bottomIndicatorInsets == 0 ? 0 : self.scrollIndicatorInsets.bottom + bottomIndicatorInsets
        self.contentInset.bottom = bottomContentInsets == 0 ? 0 : self.contentInset.bottom + bottomContentInsets
        guard let shouldScrollToPosition = shouldScrollToPosition else { return }
        self.setContentOffset(shouldScrollToPosition, animated: scrollingAnimated!)
    }
}
