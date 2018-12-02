//
//  NBOActivitiesServiceProviderProtocol.swift
//  NBO Gamification
//
//  Created by facundop on 25/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public typealias ActivitiesServiceProviderGetOfficeActivitiesForCategorySuccessClosure = (([NBOCategoryOfficeActivityCodable]) -> Void)
public typealias ActivitiesServiceProviderRegisterActivityAttemptSuccessClosure = ((NBOCategoryOfficeActivityAttemptCodable) -> Void)

protocol NBOActivitiesServiceProviderProtocol {
    func getOfficeActivitiesForCategory(idCategoryOffice: Int, success: @escaping ActivitiesServiceProviderGetOfficeActivitiesForCategorySuccessClosure, failure: @escaping ServiceProviderFailureClosure)
    func registerActivityAttempt(result: Bool, idPlayerCategoryOfficeProgress: Int, success: @escaping ActivitiesServiceProviderRegisterActivityAttemptSuccessClosure, failure: @escaping ServiceProviderFailureClosure)
}
