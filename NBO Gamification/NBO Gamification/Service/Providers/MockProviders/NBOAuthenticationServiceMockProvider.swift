//
//  NBOAuthenticationServiceMockProvider.swift
//  NBO Gamification
//
//  Created by facundop on 30/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public class NBOAuthenticationServiceMockProvider : NBOAuthenticationServiceProviderProtocol {
    
    public func login(email: String, password: String, success: @escaping AuthenticationServiceProviderLoginSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        let user_mock = NBOMockServiceProviderPlayer.player1
        
        if (user_mock.email == email) {
            
            if (user_mock.password! == password){
                let response = NBOPlayer(id: user_mock.id, email: user_mock.email, firstName: user_mock.firstName, lastName: user_mock.lastName)
                success(response)
            }
            else {
                failure("Wrong password error")
            }
        } else {
            failure("Email non existent")
        }
    }
    
    public func logout(success: @escaping AuthenticationServiceProviderLogoutSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        success()
    }
}
