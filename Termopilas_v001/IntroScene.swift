//
//  GameScene.swift
//  Termopilas_v001
//
//  Created by Leonardo Rubio 1 on 07/07/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import SpriteKit

class IntroScene: SKScene {
    override func didMoveToView(view: SKView) {
        
        /* Setup your scene here */
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!";
//        myLabel.fontSize = 65;
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
//        
//        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {

        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            
            let location = touch.locationInNode(self)
            let touchNode = nodeAtPoint(location)
           
            let playNode = childNodeWithName("PlayNode")
            let optionsNode = childNodeWithName("OptionNode")
            let shopNode = childNodeWithName("ShopNode")
            
            
            if (touchNode == playNode && playNode != nil) {
                let fadeAnimation = SKAction.fadeOutWithDuration(0.5)
                playNode?.runAction(fadeAnimation, completion:
                    {
                        let transition = SKTransition.fadeWithDuration(0.5)
                        let level1 = Level1(fileNamed: "Level1")
                        self.view?.presentScene(level1, transition: transition)
                    }
                )
            }
            
            
            
            
            if (touchNode == optionsNode && optionsNode != nil) {
                let fadeAnimation = SKAction.fadeOutWithDuration(0.5)
                optionsNode?.runAction(fadeAnimation, completion:
                    {
                        let transition = SKTransition.fadeWithDuration(0.5)
                        let option = OptionsScene(fileNamed: "OptionsScene")
                        self.view?.presentScene(option, transition: transition)
                    }
                )
            }
            
            
            
            
            if (touchNode == shopNode && shopNode != nil) {
                let fadeAnimation = SKAction.fadeOutWithDuration(0.5)
                shopNode?.runAction(fadeAnimation, completion:
                    {
                        let transition = SKTransition.fadeWithDuration(0.5)
                        let shop = ShopScene(fileNamed: "ShopScene")
                        self.view?.presentScene(shop, transition: transition)
                    }
                )
            }

            
            
            
        }

        
        
//
//        for touch in (touches as! Set<UITouch>) {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
