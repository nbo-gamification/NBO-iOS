//
//  NBOActivitiesServiceMockProvider.swift
//  NBO Gamification
//
//  Created by facundop on 30/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public class NBOActivitiesServiceMockProvider : NBOActivitiesServiceProviderProtocol {
    
    public func getOfficeActivitiesForCategory(idCategoryOffice: Int, success: @escaping ActivitiesServiceProviderGetOfficeActivitiesForCategorySuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        
        switch idCategoryOffice {
        case NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaSocial.id:
            success([NBOMockServiceProviderCategoryOfficeActivity.socialMendozaActivity1, NBOMockServiceProviderCategoryOfficeActivity.socialMendozaActivity2, NBOMockServiceProviderCategoryOfficeActivity.socialMendozaActivity3])
        case NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaProduct.id:
            success([])
        case NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaBuilding.id:
            success([])
        case NBOMockServiceProviderCategoryOffice.categoryOfficeSFSocial.id:
            success([])
        case NBOMockServiceProviderCategoryOffice.categoryOfficeSFProduct.id:
            success([])
        case NBOMockServiceProviderCategoryOffice.categoryOfficeSFBuilding.id:
            success([])
        default:
            let error = NSError(domain: "", code: 501, userInfo: nil)
            failure(error)
        }
    }
    
    public func registerActivityAttempt(result: Bool, idPlayerCategoryOfficeProgress: Int, success: @escaping ActivitiesServiceProviderRegisterActivityAttemptSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        switch result {
        case true:
            success(NBOMockServiceProviderCategoryOfficeActivityAttempt.assertAtempt)
        case false:
            let error = NSError(domain: "", code: 501, userInfo: nil)
            failure(error)
        }
    }
}
