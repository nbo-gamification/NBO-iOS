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
            switch (categoryOfficeActivityList, error) {
            case (let codableObjectList?, nil):
                var modelObjectList = [NBOCategoryOfficeActivity]()
                for codableObject in codableObjectList {
                    guard let modelObject = NBOCategoryOfficeActivity.initFromCodable(object: codableObject) else {continue}
                    modelObjectList.append(modelObject)
                }
                DispatchQueue.main.async {
                    success(modelObjectList)
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
        })
    }
    
    public func registerActivityAttempt(result: Bool, idPlayerCategoryOfficeProgress: Int, idCategoryOfficeActivity: Int, success: @escaping ActivitiesServiceProviderRegisterActivityAttemptSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        let attemptData = NBORegisterActivityAttemptData(result: result, playerCategoryOfficeProgressId: idPlayerCategoryOfficeProgress, categoryOfficeActivityId: idCategoryOfficeActivity)
        networkManager.registerActivityAttempt(attemptData: attemptData) { (categoryOfficeActivityAttempt, error) in
            // return NBOCategoryOfficeActivityAttempt or error
            switch (categoryOfficeActivityAttempt, error) {
            case (let codableObject?, nil):
                if let modelObject = NBOCategoryOfficeActivityAttempt.initFromCodable(object: codableObject) {
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
}
