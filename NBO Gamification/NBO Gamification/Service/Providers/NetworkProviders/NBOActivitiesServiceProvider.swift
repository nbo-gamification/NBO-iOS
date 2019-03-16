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
            // return NBOCategoryOfficeActivity list or error
            if let error = error {
                failure(error)
            }
            var modelObjectList = [NBOCategoryOfficeActivity]()
            if let codableObjectList = categoryOfficeActivityList {
                for codableObject in codableObjectList {
                    guard let modelObject = NBOCategoryOfficeActivity.initFromCodable(object: codableObject) else {continue}
                    modelObjectList.append(modelObject)
                }
            }
            success(modelObjectList)
        })
    }
    
    public func registerActivityAttempt(result: Bool, idPlayerCategoryOfficeProgress: Int, idCategoryOfficeActivity: Int, success: @escaping ActivitiesServiceProviderRegisterActivityAttemptSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        let attemptData = NBORegisterActivityAttemptData(result: result, playerCategoryOfficeProgressId: idPlayerCategoryOfficeProgress, categoryOfficeActivityId: idCategoryOfficeActivity)
        networkManager.registerActivityAttempt(attemptData: attemptData) { (categoryOfficeActivityAttempt, error) in
            // return NBOCategoryOfficeActivityAttempt or error
            if let error = error {
                failure(error)
            }
            if let codableObject = categoryOfficeActivityAttempt,
                let modelObject = NBOCategoryOfficeActivityAttempt.initFromCodable(object: codableObject) {
                success(modelObject)
            }
            failure("Error: empty or not valid attempt")
        }
    }
}
