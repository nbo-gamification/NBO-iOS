//
//  NBOActivitiesServiceProvider.swift
//  NBO Gamification
//
//  Created by facundop on 30/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public class NBOActivitiesServiceProvider: NBONetworkProvider, NBOActivitiesServiceProviderProtocol {
    
    public func getOfficeActivitiesForCategory(idCategoryOffice: Int, success: @escaping ActivitiesServiceProviderGetOfficeActivitiesForCategorySuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        networkManager.getActivitiesbyCategoryOffice(idCategoryOffice: idCategoryOffice, completion: { (categoryOfficeActivityList, error) in
            // TODO: return NBOCategoryOfficeActivity list or error
        })
    }
    
    public func registerActivityAttempt(result: Bool, idPlayerCategoryOfficeProgress: Int, idCategoryOfficeActivity: Int, success: @escaping ActivitiesServiceProviderRegisterActivityAttemptSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        let attemptData = NBORegisterActivityAttemptData(result: result, playerCategoryOfficeProgressId: idPlayerCategoryOfficeProgress, categoryOfficeActivityId: idCategoryOfficeActivity)
        networkManager.registerActivityAttempt(attemptData: attemptData) { (categoryOfficeActivityAttempt, error) in
            // TODO: return NBOCategoryOfficeActivityAttempt or error
        }
    }
}
