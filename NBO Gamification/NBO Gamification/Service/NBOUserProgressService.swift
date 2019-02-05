//
//  NBOUserProgressService.swift
//  NBO Gamification
//
//  Created by facundop on 25/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public typealias UserProgressServiceGetOfficesByPlayerIdSuccessClosure = (([NBOPlayerOfficeProgress]) -> Void)
public typealias UserProgressServiceSelectOfficeSuccessClosure = (([NBOPlayerCategoryOfficeProgress]) -> Void)

public class NBOUserProgressService : NBOAppService {
    
    private static let userProgressServiceProvider : NBOUserProgressServiceProviderProtocol = NBOUserProgressServiceMockProvider()
    
    public static func getOfficesByPlayerId(idPlayer: Int, success: @escaping UserProgressServiceGetOfficesByPlayerIdSuccessClosure, failure: @escaping ServiceFailureClosure) {
        userProgressServiceProvider.getOfficesByPlayerId(idPlayer: idPlayer, success: { (playerOfficeProgressList) in
            success(playerOfficeProgressList)
        }) { (error) in
            failure(error)
        }
    }

    public static func selectOffice(idPlayerOfficeProgress: Int, success: @escaping UserProgressServiceSelectOfficeSuccessClosure, failure: @escaping ServiceFailureClosure) {
        userProgressServiceProvider.selectOffice(idPlayerOfficeProgress: idPlayerOfficeProgress, success: { (playerCategoryOfficeProgressList) in
            success(playerCategoryOfficeProgressList)
        }) { (error) in
            failure(error)
        }
    }
}
