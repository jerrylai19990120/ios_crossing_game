//
//  StartScene.swift
//  ColorGame
//
//  Created by Jerry Lai on 2021-02-08.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SpriteKit

class StartScene: SKScene {
    
    var playButton: SKSpriteNode?
    var banner: SKSpriteNode?
    var gameScene: SKScene!
    var backgroundMusic: SKAudioNode!
    
    var scrollingBG: ScrollingBackground?
    
    
    override func didMove(to view: SKView) {
        playButton = self.childNode(withName: "startButton") as? SKSpriteNode
        banner = self.childNode(withName: "banner") as? SKSpriteNode
        
        scrollingBG = ScrollingBackground.scrollingNodeWithImage(image: "loopBG", containerWidth: self.size.width)
        
        scrollingBG?.scrollingSpeed = 10
        scrollingBG?.anchorPoint = .zero
        self.addChild(scrollingBG!)
        
        scrollingBG?.zPosition = -1
        banner?.zPosition = 0
        playButton?.zPosition = 0
        
        if let musicURL = Bundle.main.url(forResource: "MenuHighscoreMusic", withExtension: "mp3") {
            backgroundMusic = SKAudioNode(url: musicURL)
            addChild(backgroundMusic)
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == playButton {
                let transition = SKTransition.fade(withDuration: 1)
                gameScene = SKScene(fileNamed: "GameScene")
                gameScene.scaleMode = .aspectFit
                self.view?.presentScene(gameScene, transition: transition)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let scrollBG = self.scrollingBG {
            scrollBG.update(currentTime: currentTime)
        }
    }
}
