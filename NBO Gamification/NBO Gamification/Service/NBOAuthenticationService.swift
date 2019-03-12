//
//  NBOAuthenticationService.swift
//  NBO Gamification
//
//  Created by facundop on 25/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public typealias AuthenticationServiceLoginSuccessClosure = ((NBOPlayer) -> Void)
public typealias AuthenticationServiceLogoutSuccessClosure = (() -> Void)

public class NBOAuthenticationService {
    
    private static let authenticationServiceProvider : NBOAuthenticationServiceProviderProtocol = NBOAuthenticationServiceMockProvider()
    
    public static func login(email: String, password: String, success: @escaping AuthenticationServiceLoginSuccessClosure, failure: @escaping ServiceFailureClosure) {
        
        authenticationServiceProvider.login(email: email, password: password, success: { (authenticationServiceLoginResponse) in
            success(authenticationServiceLoginResponse)
        }, failure: { (error) in
            failure(error)
        })        
    }
    
    public static func logout(success: @escaping AuthenticationServiceLogoutSuccessClosure, failure: @escaping ServiceFailureClosure) {
        authenticationServiceProvider.logout(success: {
            success()
        }) { (error) in
            failure(error)
        }
    }
}
