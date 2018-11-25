//
//  NBOPlayer+Persistence.swift
//  NBO Gamification
//
//  Created by dante on 24/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

extension NBOPlayer: PersistenceHelper {

    public typealias ImmutableModel = Player
    public typealias Model = NBOPlayer

    public static func getModelObject(object: Player) -> NBOPlayer {
        let player = NBOPlayer()
        player.firstName = object.firstName
        player.lastName = object.lastName
        player.email = object.email
        player.password = object.password
        player.isActive = object.isActive

        return player
    }
}
