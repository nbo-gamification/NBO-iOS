//
//  NBOServiceProviderMockData.swift
//  NBO Gamification
//
//  Created by facundop on 30/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

enum NBOMockServiceProviderCategory {
    static let categorySocial = NBOCategoryCodable(id: 1, name: "Social", description: "Social category")
    static let categoryProduct = NBOCategoryCodable(id: 2, name: "Product", description: "Product category")
    static let categoryBuilding =  NBOCategoryCodable(id: 3, name: "Building", description: "Building category")
}

enum NBOMockServiceProviderPlayer {
    static let player1 = NBOPlayerCodable(email: "dante@evbqa.com", firstName: "Dante", lastName: "Canizo", password: "12345", isActive: true)
    static let player2 = NBOPlayerCodable(email: "karinap@evbqa.com", firstName: "Karina", lastName: "Pangaro", password: "123456", isActive: true)
}

enum NBOMockServiceProviderOffice {
    static let officeMendoza = NBOOfficeCodable(id: 123, name: "Mendoza")
    static let officeSanFrancisco = NBOOfficeCodable(id: 456, name: "San Francisco")
}

enum NBOMockServiceProviderCategoryOffice {
    static let categoryOfficeMendozaSocial = NBOCategoryOfficeCodable(id: 1, totalPointsRequired: 50, isActive: true, office: NBOMockServiceProviderOffice.officeMendoza, category: NBOMockServiceProviderCategory.categorySocial)
    static let categoryOfficeMendozaProduct = NBOCategoryOfficeCodable(id: 1, totalPointsRequired: 50, isActive: true, office: NBOMockServiceProviderOffice.officeMendoza, category: NBOMockServiceProviderCategory.categoryProduct)
    static let categoryOfficeMendozaBuilding = NBOCategoryOfficeCodable(id: 1, totalPointsRequired: 50, isActive: true, office: NBOMockServiceProviderOffice.officeMendoza, category: NBOMockServiceProviderCategory.categoryBuilding)
    
    static let categoryOfficeSFSocial = NBOCategoryOfficeCodable(id: 1, totalPointsRequired: 50, isActive: true, office: NBOMockServiceProviderOffice.officeSanFrancisco, category: NBOMockServiceProviderCategory.categoryBuilding)
    static let categoryOfficeSFProduct = NBOCategoryOfficeCodable(id: 1, totalPointsRequired: 50, isActive: true, office: NBOMockServiceProviderOffice.officeSanFrancisco, category: NBOMockServiceProviderCategory.categoryProduct)
    static let categoryOfficeSFBuilding = NBOCategoryOfficeCodable(id: 1, totalPointsRequired: 50, isActive: true, office: NBOMockServiceProviderOffice.officeSanFrancisco, category: NBOMockServiceProviderCategory.categoryBuilding)
}

enum NBOMockServiceProviderPlayerCategoryOfficeProgress {
    static let progressMendozaSocial = NBOPlayerCategoryOfficeProgressCodable(id: 1, totalPoints: 20, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaSocial)
    static let progressMendozaProduct = NBOPlayerCategoryOfficeProgressCodable(id: 2, totalPoints: 10, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaProduct)
    static let progressMendozaBuilding = NBOPlayerCategoryOfficeProgressCodable(id: 3, totalPoints: 47, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaBuilding)
    
    static let progressSFSocial = NBOPlayerCategoryOfficeProgressCodable(id: 1, totalPoints: 0, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeSFSocial)
    static let progressSFProduct = NBOPlayerCategoryOfficeProgressCodable(id: 2, totalPoints: 50, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeSFProduct)
    static let progressSFBuilding = NBOPlayerCategoryOfficeProgressCodable(id: 3, totalPoints: 60, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeSFBuilding)
}


enum NBOMockServiceProviderPlayerOfficeProgress {
    static let player1ProgressMendoza = NBOPlayerOfficeProgressCodable (id: 1, player: NBOMockServiceProviderPlayer.player1, office: NBOMockServiceProviderOffice.officeMendoza, categoryOfficeProgressList: [NBOMockServiceProviderPlayerCategoryOfficeProgress.progressMendozaSocial , NBOMockServiceProviderPlayerCategoryOfficeProgress.progressMendozaProduct , NBOMockServiceProviderPlayerCategoryOfficeProgress.progressMendozaBuilding])
    
    static let player1ProgressSF = NBOPlayerOfficeProgressCodable (id: 2, player: NBOMockServiceProviderPlayer.player1, office: NBOMockServiceProviderOffice.officeSanFrancisco, categoryOfficeProgressList: [NBOMockServiceProviderPlayerCategoryOfficeProgress.progressSFSocial , NBOMockServiceProviderPlayerCategoryOfficeProgress.progressSFProduct , NBOMockServiceProviderPlayerCategoryOfficeProgress.progressSFBuilding])
}

enum NBOMockServiceProviderActivityType {
    static let activityTypeConnect = NBOActivityTypeCodable(name: "Connect")
}

enum NBOMockServiceProviderActivity {
    static let connectActivity1 = NBOActivityCodable(id: 1, description: "Connect activity 1", isActive: true, type: NBOMockServiceProviderActivityType.activityTypeConnect, instructions: "Ask Dante for password", solutionCode: "12345")
    static let connectActivity2 = NBOActivityCodable(id: 2, description: "Connect activity 2", isActive: true, type: NBOMockServiceProviderActivityType.activityTypeConnect, instructions: "Ask Florencia for password", solutionCode: "12345")
    static let connectActivity3 = NBOActivityCodable(id: 3, description: "Connect activity 3", isActive: true, type: NBOMockServiceProviderActivityType.activityTypeConnect, instructions: "Ask Manu for password", solutionCode: "12345")
}

enum NBOMockServiceProviderCategoryOfficeActivity {
    static let socialMendozaActivity1 = NBOCategoryOfficeActivityCodable(id: 1, pointsReward: 5, isActive: true, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaSocial, activity: NBOMockServiceProviderActivity.connectActivity1)
    static let socialMendozaActivity2 = NBOCategoryOfficeActivityCodable(id: 1, pointsReward: 5, isActive: true, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaSocial, activity: NBOMockServiceProviderActivity.connectActivity2)
    static let socialMendozaActivity3 = NBOCategoryOfficeActivityCodable(id: 1, pointsReward: 5, isActive: true, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaSocial, activity: NBOMockServiceProviderActivity.connectActivity3)
}

