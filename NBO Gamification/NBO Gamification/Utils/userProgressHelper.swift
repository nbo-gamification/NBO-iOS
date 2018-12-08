//
//  userProgressHelper.swift
//  NBO Gamification
//
//  Created by facundop on 04/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import Foundation

class userProgressHelper {
    
    static func calculateCompletionRatio (points : Int, totalPoints : Int) -> Float {
        
        let ratio = Float(points)/Float(totalPoints)
        
        return ratio > 1 ? 1 : ratio
    }
    
    static func calculateCompletionPercentage (points : Int, totalPoints : Int) -> String {
        
        let ratio = calculateCompletionRatio(points: points, totalPoints: totalPoints)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.locale = Locale(identifier: "en")
        
        return formatter.string(for: ratio)!
    }
}
