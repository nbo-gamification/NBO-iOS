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
    }
    
    public func logout(success: @escaping AuthenticationServiceProviderLogoutSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        
    }
}
