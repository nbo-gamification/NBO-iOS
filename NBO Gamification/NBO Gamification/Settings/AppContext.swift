//
//  AppContext.swift
//  NBO Gamification
//
//  Created by facundop on 12/03/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

import Foundation

public class AppContext {
    public static let shared = AppContext()
    
    public static func initialize() {
        _ = shared
    }
    
    // Stored properties and configuration
    public var currentUserId = StoredConfig<Int>(key: .currentUserId, defaultValue: -1)
    public var currentUserToken = StoredConfig<String>(key: .currentUserToken, defaultValue: "")
}
