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
        networkManager.getOfficesByPlayer(idPlayer: idPlayer) { (playerOfficeProgressList, error) in
            // return NBOPlayerOfficeProgress list or error
            switch (playerOfficeProgressList, error) {
            case (let codableObjectList?, nil):
                var modelObjectList = [NBOPlayerOfficeProgress]()
                for codableObject in codableObjectList {
                    guard let modelObject = NBOPlayerOfficeProgress.initFromCodable(object: codableObject) else {continue}
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
        }
    }
    
    public func selectOffice(idPlayerOfficeProgress: Int, success: @escaping UserProgressServiceProviderSelectOfficeSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        networkManager.selectOffice(playerOfficeProgressId: idPlayerOfficeProgress) { (playerCategoryOfficeProgressList, error) in
            // return NBOPlayerCategoryOfficeProgress list or error
            switch (playerCategoryOfficeProgressList, error) {
            case (let codableObjectList?, nil):
                var modelObjectList = [NBOPlayerCategoryOfficeProgress]()
                for codableObject in codableObjectList {
                    guard let modelObject = NBOPlayerCategoryOfficeProgress.initFromCodable(object: codableObject) else {continue}
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
        }
    }
}
