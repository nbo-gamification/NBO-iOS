//
//  NBOActivitiesServiceProviderProtocol.swift
//  NBO Gamification
//
//  Created by facundop on 25/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public typealias ActivitiesServiceProviderGetOfficeActivitiesForCategorySuccessClosure = (([NBOCategoryOfficeActivity]) -> Void)
public typealias ActivitiesServiceProviderRegisterActivityAttemptSuccessClosure = ((NBOCategoryOfficeActivityAttempt) -> Void)

protocol NBOActivitiesServiceProviderProtocol {
    func getOfficeActivitiesForCategory(idCategoryOffice: Int, success: @escaping ActivitiesServiceProviderGetOfficeActivitiesForCategorySuccessClosure, failure: @escaping ServiceProviderFailureClosure)
    func registerActivityAttempt(result: Bool, idPlayerCategoryOfficeProgress: Int, idCategoryOfficeActivity: Int, success: @escaping ActivitiesServiceProviderRegisterActivityAttemptSuccessClosure, failure: @escaping ServiceProviderFailureClosure)
}
