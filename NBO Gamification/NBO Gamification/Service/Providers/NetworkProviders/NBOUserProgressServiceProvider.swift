//
//  NBOUserProgressServiceProvider.swift
//  NBO Gamification
//
//  Created by facundop on 30/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public class NBOUserProgressServiceProvider: NBONetworkProvider, NBOUserProgressServiceProviderProtocol {
    func getOfficesByPlayerId(idPlayer: Int, success: @escaping UserProgressServiceProviderGetOfficesByPlayerIdSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        networkManager.getOfficesByPlayer { (playerOfficeProgressList, error) in
            // return NBOPlayerOfficeProgress list or error
            if let error = error {
                DispatchQueue.main.async {
                    failure(error)
                }
            }
            var modelObjectList = [NBOPlayerOfficeProgress]()
            if let codableObjectList = playerOfficeProgressList {
                for codableObject in codableObjectList {
                    guard let modelObject = NBOPlayerOfficeProgress.initFromCodable(object: codableObject) else {continue}
                    modelObjectList.append(modelObject)
                }
            }
            DispatchQueue.main.async {
                success(modelObjectList)
            }
        }
    }
    
    public func selectOffice(idPlayerOfficeProgress: Int, success: @escaping UserProgressServiceProviderSelectOfficeSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        networkManager.selectOffice(playerOfficeProgressId: idPlayerOfficeProgress) { (playerCategoryOfficeProgressList, error) in
            // return NBOPlayerCategoryOfficeProgress list or error
            if let error = error {
                DispatchQueue.main.async {
                    failure(error)
                }
            }
            var modelObjectList = [NBOPlayerCategoryOfficeProgress]()
            if let codableObjectList = playerCategoryOfficeProgressList {
                for codableObject in codableObjectList {
                    guard let modelObject = NBOPlayerCategoryOfficeProgress.initFromCodable(object: codableObject) else {continue}
                    modelObjectList.append(modelObject)
                }
            }
            DispatchQueue.main.async {
                success(modelObjectList)
            }
        }
    }
}
