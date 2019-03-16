//
//  NBOActivitiesService.swift
//  NBO Gamification
//
//  Created by facundop on 25/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public typealias ActivitiesServiceGetOfficeActivitiesForCategorySuccessClosure = (([NBOCategoryOfficeActivity]) -> Void)
public typealias ActivitiesServiceRegisterActivityAttemptSuccessClosure = ((NBOCategoryOfficeActivityAttempt) -> Void)

public class NBOActivitiesService {
    
    private static let activitiesServiceProvider : NBOActivitiesServiceProviderProtocol = NBOActivitiesServiceProvider()
    
    public static func getOfficeActivitiesForCategory(idCategoryOffice: Int, success: @escaping ActivitiesServiceGetOfficeActivitiesForCategorySuccessClosure, failure: @escaping ServiceFailureClosure) {
        activitiesServiceProvider.getOfficeActivitiesForCategory(idCategoryOffice: idCategoryOffice, success: { (categoryOfficeActivityList) in
            success(categoryOfficeActivityList)
        }) { (error) in
            failure(error)
        }
    }
    
    public static func registerActivityAttempt(result: Bool, idPlayerCategoryOfficeProgress: Int, idCategoryOfficeActivity: Int, success: @escaping ActivitiesServiceRegisterActivityAttemptSuccessClosure, failure: @escaping ServiceFailureClosure) {
        activitiesServiceProvider.registerActivityAttempt(result: result, idPlayerCategoryOfficeProgress: idPlayerCategoryOfficeProgress, idCategoryOfficeActivity: idCategoryOfficeActivity, success: { (categoryOfficeActivityAttempt) in
            success(categoryOfficeActivityAttempt)
        }) { (error) in
            failure(error)
        }
    }
}
