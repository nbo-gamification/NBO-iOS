//
//  NBOActivityType.swift
//  NBO Gamification
//
//  Created by facundop on 27/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public final class NBOActivityType {
    
    public let name : String

    public let typeKeys: TypeKeys?
    
    init(name: String) {
        self.name = name
        self.typeKeys = TypeKeys(name: name)
    }


}

public enum TypeKeys: String {

    case connect = "Connect"
    case trivia = "Trivia"
    case productCheck = "ProductCheck"

    init?(name: String?) {
        switch name {
        case "Connect": self = .connect

        case "Trivia": self = .trivia

        case "ProductCheck": self = .productCheck

        default:
            return nil
        }
    }
}
