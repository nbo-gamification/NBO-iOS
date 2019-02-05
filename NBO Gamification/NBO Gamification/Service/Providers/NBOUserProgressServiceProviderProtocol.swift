//
//  NBOUserProgressServiceProviderProtocol.swift
//  NBO Gamification
//
//  Created by facundop on 25/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public typealias UserProgressServiceProviderGetOfficesByPlayerIdSuccessClosure = (([NBOPlayerOfficeProgress]) -> Void)
public typealias UserProgressServiceProviderSelectOfficeSuccessClosure = (([NBOPlayerCategoryOfficeProgress]) -> Void)

protocol NBOUserProgressServiceProviderProtocol {
    func getOfficesByPlayerId(idPlayer: Int, success: @escaping UserProgressServiceProviderGetOfficesByPlayerIdSuccessClosure, failure: @escaping ServiceProviderFailureClosure)
    func selectOffice(idPlayerOfficeProgress: Int, success: @escaping UserProgressServiceProviderSelectOfficeSuccessClosure, failure: @escaping ServiceProviderFailureClosure)
}
