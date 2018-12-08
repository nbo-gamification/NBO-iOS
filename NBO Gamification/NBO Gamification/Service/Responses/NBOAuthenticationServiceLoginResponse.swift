//
//  NBOAuthenticationServiceLoginResponse.swift
//  NBO Gamification
//
//  Created by facundop on 06/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public class NBOAuthenticationServiceLoginResponse {
    
    public let player: NBOPlayer
    public let playerOfficeProgressList: [NBOPlayerOfficeProgress]
    
    init(player: NBOPlayer, playerOfficeProgressList: [NBOPlayerOfficeProgress]) {
        self.player = player
        self.playerOfficeProgressList = playerOfficeProgressList
    }
}
