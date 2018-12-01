//
//  NBOUserProgressServiceProviderProtocol.swift
//  NBO Gamification
//
//  Created by facundop on 25/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

public typealias UserProgressServiceProviderSelectOfficeSuccessClosure = (([NBOPlayerCategoryOfficeProgressCodable]) -> Void)

protocol NBOUserProgressServiceProviderProtocol {
    func selectOffice(idPlayerOfficeProgress: Int, success: @escaping UserProgressServiceProviderSelectOfficeSuccessClosure, failure: @escaping ServiceProviderFailureClosure)
}
