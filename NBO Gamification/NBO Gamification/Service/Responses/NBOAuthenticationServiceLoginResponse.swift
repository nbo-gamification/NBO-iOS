//
//  NBOAuthenticationServiceLoginResponse.swift
//  NBO Gamification
//
//  Created by facundop on 06/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public class NBOAuthenticationServiceLoginResponse {
    
    public let player: NBOPlayerCodable
    public let playerOfficeProgressList: [NBOPlayerOfficeProgressCodable]
    
    init(player: NBOPlayerCodable, playerOfficeProgressList: [NBOPlayerOfficeProgressCodable]) {
        self.player = player
        self.playerOfficeProgressList = playerOfficeProgressList
    }
}
