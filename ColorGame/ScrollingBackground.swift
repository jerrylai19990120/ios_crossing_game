//
//  ScrollingBackground.swift
//  ColorGame
//
//  Created by Jerry Lai on 2021-02-08.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit
import SpriteKit

class ScrollingBackground: SKSpriteNode {
    
    var scrollingSpeed: CGFloat = 0
    
    static func scrollingNodeWithImage(image: String, containerWidth: CGFloat)->ScrollingBackground {
        let bgImage = UIImage(named: image)!
        
        let scrollNode = ScrollingBackground(color: UIColor.clear, size: CGSize(width: containerWidth, height: bgImage.size.height))
        
        scrollNode.scrollingSpeed = 1
        
        var totalWidthNeeded: CGFloat = 0
        
        while totalWidthNeeded < containerWidth + bgImage.size.width {
            let child = SKSpriteNode(imageNamed: image)
            child.anchorPoint = CGPoint.zero
            child.position = CGPoint(x: totalWidthNeeded, y: 0)
            scrollNode.addChild(child)
            totalWidthNeeded += child.size.width
        }
        
        return scrollNode
    }
    
    func update(currentTime: TimeInterval) {
        for child in self.children {
            child.position = CGPoint(x: child.position.x-scrollingSpeed, y: child.position.y)
            
            if child.position.x <= -child.frame.size.width {
                let delta = child.position.x + child.frame.size.width
                child.position = CGPoint(x: child.frame.size.width*CGFloat(self.children.count-1)+delta, y: child.position.y)
            }
        }
    }
    
}