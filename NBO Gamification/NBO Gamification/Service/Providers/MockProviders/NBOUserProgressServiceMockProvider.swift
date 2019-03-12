//
//  NBOUserProgressServiceMockProvider.swift
//  NBO Gamification
//
//  Created by facundop on 30/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public class NBOUserProgressServiceMockProvider : NBOUserProgressServiceProviderProtocol {
    func getOfficesByPlayerId(idPlayer: Int, success: @escaping UserProgressServiceProviderGetOfficesByPlayerIdSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        switch idPlayer {
        case NBOMockServiceProviderPlayer.player1.id:
            success([
                NBOMockServiceProviderPlayerOfficeProgress.player1ProgressMendoza,
                NBOMockServiceProviderPlayerOfficeProgress.player1ProgressSF
                ])
        default:
            failure("getOfficesByPlayerId error")
        }
    }
    
    public func selectOffice(idPlayerOfficeProgress: Int, success: @escaping UserProgressServiceProviderSelectOfficeSuccessClosure, failure: @escaping ServiceProviderFailureClosure) {
        
        switch idPlayerOfficeProgress {
        case NBOMockServiceProviderPlayerOfficeProgress.player1ProgressMendoza.id:
            success([
                NBOMockServiceProviderPlayerCategoryOfficeProgress.progressMendozaSocial,
                NBOMockServiceProviderPlayerCategoryOfficeProgress.progressMendozaBuilding,
                NBOMockServiceProviderPlayerCategoryOfficeProgress.progressMendozaProduct
            ])
        case NBOMockServiceProviderPlayerOfficeProgress.player1ProgressSF.id:
            success([
                NBOMockServiceProviderPlayerCategoryOfficeProgress.progressSFSocial,
                NBOMockServiceProviderPlayerCategoryOfficeProgress.progressSFBuilding,
                NBOMockServiceProviderPlayerCategoryOfficeProgress.progressSFProduct
                ])
        default:
            failure("selectOffice error")
        }
    }
}
