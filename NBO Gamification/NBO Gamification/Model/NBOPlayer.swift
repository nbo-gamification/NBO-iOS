//
//  NBOPlayer.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public final class NBOPlayer {
    
    public let email : String
    public var firstName : String
    public var lastName : String
    public var password: String?
    public var isActive: Bool?
   
    init(email : String, firstName : String, lastName : String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
    }
    
    convenience init(email : String, firstName : String, lastName : String, password: String) {
        self.init(email: email, firstName: firstName, lastName: lastName)
        self.password = password
    }
}
