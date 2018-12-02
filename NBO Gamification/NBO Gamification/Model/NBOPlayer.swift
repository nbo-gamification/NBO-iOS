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
   
    init(email : String, firstName : String, lastName : String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
    }
}
