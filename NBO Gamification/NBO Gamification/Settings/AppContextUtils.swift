//
//  AppContextUtils.swift
//  NBO Gamification
//
//  Created by facundop on 12/03/2019.
//  Copyright © 2019 nbogamification. All rights reserved.
//

import Foundation

enum StoredConfigKeys: String {
    case currentUserId = "current_user_id"
    case currentUserToken = "current_user_token"
    
    var value: String { return self.rawValue }
}

public struct StoredConfig<T> {
    private let key: StoredConfigKeys
    private var value: T?
    private let defaultValue: T
    
    init(key: StoredConfigKeys, defaultValue: T) {
        self.key = key
        self.value = defaultValue
        self.defaultValue = defaultValue
        
        inflate()
    }
    
    private mutating func inflate() {
        value = UserDefaults.standard.object(forKey: key.value) as? T ?? defaultValue
    }
    
    func get() -> T {
        return value ?? defaultValue
    }
    
    mutating func set(newValue: T) {
        value = newValue
        UserDefaults.standard.set(value, forKey: key.value)
    }
    
    mutating func clear() {
        value = defaultValue
        UserDefaults.standard.set(nil, forKey: key.value)
    }
}
