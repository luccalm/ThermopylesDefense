//
//  ShopScene.swift
//  Termopilas_v001
//
//  Created by Leonardo Rubio 1 on 07/07/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class ShopScene: SKScene {
   
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        /* Called when a touch begins */
        
        let returnNode = childNodeWithName("ReturnButton")
        
        if (returnNode != nil) {
            let fadeAnimation = SKAction.fadeOutWithDuration(0.5)
            returnNode?.runAction(fadeAnimation, completion:
                {
                    let transition = SKTransition.fadeWithDuration(0.5)
                    let intro = IntroScene(fileNamed: "IntroScene")
                    self.view?.presentScene(intro, transition: transition)
                }
            )
        }
    }

    
}
