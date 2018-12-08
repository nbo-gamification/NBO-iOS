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

public class NBOActivitiesService : NBOAppService {
    
    private static let activitiesServiceProvider : NBOActivitiesServiceProviderProtocol = NBOActivitiesServiceMockProvider()
    
    public static func getOfficeActivitiesForCategory(idCategoryOffice: Int, success: @escaping ActivitiesServiceGetOfficeActivitiesForCategorySuccessClosure, failure: @escaping ServiceFailureClosure) {
        
        activitiesServiceProvider.getOfficeActivitiesForCategory(idCategoryOffice: idCategoryOffice, success: { (categoryOfficeActivityCodableList) in
            success(categoryOfficeActivityCodableList)
        }) { (error) in
            failure(error)
        }
    }
    
    public static func registerActivityAttempt(result: Bool, idPlayerCategoryOfficeProgress: Int, success: @escaping ActivitiesServiceRegisterActivityAttemptSuccessClosure, failure: @escaping ServiceFailureClosure) {
        
        activitiesServiceProvider.registerActivityAttempt(result: result, idPlayerCategoryOfficeProgress: idPlayerCategoryOfficeProgress, success: { (categoryOfficeActivityAttemptCodable) in
            success(categoryOfficeActivityAttemptCodable)
        }) { (error) in
            failure(error)
        }
    }
}
