//
//  NBOAuthenticationServiceProviderProtocol.swift
//  NBO Gamification
//
//  Created by facundop on 25/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public typealias AuthenticationServiceProviderLoginSuccessClosure = ((NBOPlayer) -> Void)
public typealias AuthenticationServiceProviderLogoutSuccessClosure = (() -> Void)

protocol NBOAuthenticationServiceProviderProtocol {
    func login(email: String, password: String, success: @escaping AuthenticationServiceProviderLoginSuccessClosure, failure: @escaping ServiceProviderFailureClosure)
    func logout(success: @escaping AuthenticationServiceProviderLogoutSuccessClosure, failure: @escaping ServiceProviderFailureClosure)
}
