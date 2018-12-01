//
//  NBOAuthenticationServiceLoginResponse.swift
//  NBO Gamification
//
//  Created by facundop on 29/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public struct NBOAuthenticationServiceLoginResponse : Codable {
    
    public let player: NBOPlayerCodable?
    public let playerOfficeProgressList: [NBOPlayerOfficeProgressCodable]?
   
    init(player: NBOPlayerCodable, playerOfficeProgressList: [NBOPlayerOfficeProgressCodable]) {
        self.player = player
        self.playerOfficeProgressList = playerOfficeProgressList
    }
    
    enum CodingKeys: String, CodingKey {
        case player
        case playerOfficeProgressList
    }
}
