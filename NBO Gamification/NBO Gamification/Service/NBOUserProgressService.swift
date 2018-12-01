//
//  NBOUserProgressService.swift
//  NBO Gamification
//
//  Created by facundop on 25/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public typealias UserProgressServiceSelectOfficeSuccessClosure = (([NBOPlayerCategoryOfficeProgressCodable]) -> Void)

public class NBOUserProgressService : NBOAppService {
    
    private static let userProgressServiceProvider : NBOUserProgressServiceProviderProtocol = NBOUserProgressServiceMockProvider()
    
    public static func selectOffice(idPlayerOfficeProgress: Int, success: @escaping UserProgressServiceSelectOfficeSuccessClosure, failure: @escaping ServiceFailureClosure) {
        
        userProgressServiceProvider.selectOffice(idPlayerOfficeProgress: idPlayerOfficeProgress, success: { (playerOfficeProgressCodableList) in
            success(playerOfficeProgressCodableList)
        }) { (error) in
            failure(error)
        }
    }
}
