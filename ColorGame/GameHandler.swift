//
//  GameHandler.swift
//  ColorGame
//
//  Created by Jerry Lai on 2021-02-08.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation


class GameHandler {
    
    var score: Int
    var highScore: Int
    
    class var sharedInstance: GameHandler {
        struct Singleton {
            static let instance = GameHandler()
        }
        return Singleton.instance
    }
    
    init(){
        score = 0
        highScore = 0
        
        let userDefaults = UserDefaults.standard
        highScore = userDefaults.integer(forKey: "highScore")
        
    }
    
    func saveGameScore(){
        highScore = max(score, highScore)
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(highScore, forKey: "highScore")
        userDefaults.synchronize()
        
    }
}
