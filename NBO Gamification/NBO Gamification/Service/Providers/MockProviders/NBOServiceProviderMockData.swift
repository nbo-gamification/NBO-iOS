//
//  NBOServiceProviderMockData.swift
//  NBO Gamification
//
//  Created by facundop on 30/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

enum NBOMockServiceProviderCategory {
    static let categorySocial = NBOCategory(id: 1, name: "Social", description: "Social category")
    static let categoryProduct = NBOCategory(id: 2, name: "Product", description: "Product category")
    static let categoryBuilding =  NBOCategory(id: 3, name: "Building", description: "Building category")
}

enum NBOMockServiceProviderPlayer {
    static let player1 = NBOPlayer(id: 1, email: "dante@evbqa.com", firstName: "Dante", lastName: "Canizo", password: "12345")
    static let player2 = NBOPlayer(id: 2, email: "karinap@evbqa.com", firstName: "Karina", lastName: "Pangaro", password: "12345")
}

enum NBOMockServiceProviderOffice {
    static let officeMendoza = NBOOffice(id: 123, name: "Mendoza")
    static let officeSanFrancisco = NBOOffice(id: 456, name: "San Francisco")
}

enum NBOMockServiceProviderCategoryOffice {
    static let categoryOfficeMendozaSocial = NBOCategoryOffice(id: 1, totalPointsRequired: 50, isActive: true, office: NBOMockServiceProviderOffice.officeMendoza, category: NBOMockServiceProviderCategory.categorySocial)
    static let categoryOfficeMendozaProduct = NBOCategoryOffice(id: 2, totalPointsRequired: 50, isActive: true, office: NBOMockServiceProviderOffice.officeMendoza, category: NBOMockServiceProviderCategory.categoryProduct)
    static let categoryOfficeMendozaBuilding = NBOCategoryOffice(id: 3, totalPointsRequired: 50, isActive: true, office: NBOMockServiceProviderOffice.officeMendoza, category: NBOMockServiceProviderCategory.categoryBuilding)
    
    static let categoryOfficeSFSocial = NBOCategoryOffice(id: 4, totalPointsRequired: 50, isActive: true, office: NBOMockServiceProviderOffice.officeSanFrancisco, category: NBOMockServiceProviderCategory.categorySocial)
    static let categoryOfficeSFProduct = NBOCategoryOffice(id: 5, totalPointsRequired: 50, isActive: true, office: NBOMockServiceProviderOffice.officeSanFrancisco, category: NBOMockServiceProviderCategory.categoryProduct)
    static let categoryOfficeSFBuilding = NBOCategoryOffice(id: 6, totalPointsRequired: 50, isActive: true, office: NBOMockServiceProviderOffice.officeSanFrancisco, category: NBOMockServiceProviderCategory.categoryBuilding)
}

enum NBOMockServiceProviderPlayerCategoryOfficeProgress {
    static let progressMendozaSocial = NBOPlayerCategoryOfficeProgress(id: 1, totalPoints: 20, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaSocial)
    static let progressMendozaProduct = NBOPlayerCategoryOfficeProgress(id: 2, totalPoints: 10, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaProduct)
    static let progressMendozaBuilding = NBOPlayerCategoryOfficeProgress(id: 3, totalPoints: 50, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaBuilding)
    
    static let progressSFSocial = NBOPlayerCategoryOfficeProgress(id: 4, totalPoints: 0, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeSFSocial)
    static let progressSFProduct = NBOPlayerCategoryOfficeProgress(id: 5, totalPoints: 46, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeSFProduct)
    static let progressSFBuilding = NBOPlayerCategoryOfficeProgress(id: 6, totalPoints: 60, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeSFBuilding)
}

enum NBOMockServiceProviderPlayerOfficeProgress {
    static let player1ProgressMendoza = NBOPlayerOfficeProgress (id: 1, office: NBOMockServiceProviderOffice.officeMendoza, categoryOfficeProgressList: [NBOMockServiceProviderPlayerCategoryOfficeProgress.progressMendozaSocial, NBOMockServiceProviderPlayerCategoryOfficeProgress.progressMendozaProduct , NBOMockServiceProviderPlayerCategoryOfficeProgress.progressMendozaBuilding],
        player: NBOMockServiceProviderPlayer.player1)
    
    static let player1ProgressSF = NBOPlayerOfficeProgress (id: 2, office: NBOMockServiceProviderOffice.officeSanFrancisco, categoryOfficeProgressList: [NBOMockServiceProviderPlayerCategoryOfficeProgress.progressSFSocial , NBOMockServiceProviderPlayerCategoryOfficeProgress.progressSFProduct , NBOMockServiceProviderPlayerCategoryOfficeProgress.progressSFBuilding],
        player: NBOMockServiceProviderPlayer.player1)
}

enum NBOMockServiceProviderActivityType {
    static let activityTypeConnect = NBOActivityType(name: "Connect")
}

enum NBOMockServiceProviderActivity {
    static let connectActivity1 = NBOConnectActivity(id: 1, description: "Connect activity 1", isActive: true, type: NBOMockServiceProviderActivityType.activityTypeConnect, instructions: "Ask Dante for password", solutionCode: "12345")
    static let connectActivity2 = NBOConnectActivity(id: 2, description: "Connect activity 2", isActive: true, type: NBOMockServiceProviderActivityType.activityTypeConnect, instructions: "Ask Florencia for password", solutionCode: "12345")
    static let connectActivity3 = NBOConnectActivity(id: 3, description: "Connect activity 3", isActive: true, type: NBOMockServiceProviderActivityType.activityTypeConnect, instructions: "Ask Manu for password", solutionCode: "12345")
}

enum NBOMockServiceProviderCategoryOfficeActivity {
    static let socialMendozaActivity1 = NBOCategoryOfficeActivity(id: 1, pointsReward: 5, isActive: true, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaSocial, activity: NBOMockServiceProviderActivity.connectActivity1)
    static let socialMendozaActivity2 = NBOCategoryOfficeActivity(id: 2, pointsReward: 5, isActive: true, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaSocial, activity: NBOMockServiceProviderActivity.connectActivity2)
    static let socialMendozaActivity3 = NBOCategoryOfficeActivity(id: 3, pointsReward: 5, isActive: true, categoryOffice: NBOMockServiceProviderCategoryOffice.categoryOfficeMendozaSocial, activity: NBOMockServiceProviderActivity.connectActivity3)
}

enum NBOMockServiceProviderCategoryOfficeActivityAttempt {

    static let assertAtempt = NBOCategoryOfficeActivityAttempt(id: 1, datetime: Date(), result: true, playerCategoryOfficeProgress: NBOMockServiceProviderPlayerCategoryOfficeProgress.progressMendozaSocial, categoryOfficeActivity: NBOMockServiceProviderCategoryOfficeActivity.socialMendozaActivity1)
}
