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
            // TODO: return NBOPlayerOfficeProgress list or error
        }
    }
    
    public func selectOffice(idPlayerOfficeProgress: Int, success: @escaping UserProgressServiceProviderSelectOfficeSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        networkManager.selectOffice(playerOfficeProgressId: idPlayerOfficeProgress) { (playerCategoryOfficeProgressList, error) in
             // TODO: return NBOPlayerCategoryOfficeProgress list or error
        }
    }
}
