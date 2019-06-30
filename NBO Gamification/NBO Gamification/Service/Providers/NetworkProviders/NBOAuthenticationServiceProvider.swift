//
//  NBOAuthenticationServiceProvider.swift
//  NBO Gamification
//
//  Created by facundop on 30/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public class NBOAuthenticationServiceProvider: NBONetworkProvider, NBOAuthenticationServiceProviderProtocol {
    
    public func login(email: String, password: String, success: @escaping AuthenticationServiceProviderLoginSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        let loginData = NBOLoginData(user: nil, email: email, password: password)
        networkManager.login(loginData: loginData) { (player, error) in
            // return NBOPlayer or error
            switch (player, error) {
            case (let codableObject?, nil):
                if let modelObject = NBOPlayer.initFromCodable(object: codableObject) {
                    DispatchQueue.main.async {
                        success(modelObject)
                    }
                }
            case (nil, let error?):
                DispatchQueue.main.async {
                    failure(error)
                }
            default:
                DispatchQueue.main.async {
                    failure("Error: empty or not valid attempt")
                }
            }
        }
    }

    public func logout(success: @escaping AuthenticationServiceProviderLogoutSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        DispatchQueue.main.async {
            
        }
    }
}
