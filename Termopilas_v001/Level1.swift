//
//  Level1.swift
//  Termopilas_v001
//
//  Created by Leonardo Rubio 1 on 07/07/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class Level1: SKScene {
    
    var posicao : CGPoint!
    var posicaoFinal : CGPoint!
    
    var soldierGroup : SKNode!

    override func didMoveToView(view: SKView) {
        
        soldierGroup = childNodeWithName("soldierGroup")

        var yVar = 600
        
        for i in 0 ... 5 {
            var soldado = soldierNode()
            soldado.position = CGPoint(x: 0, y: yVar)
            soldierGroup!.addChild(soldado)
            yVar = yVar - 200
            soldado.animationTest()
        }
        
        
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            
            let location = touch.locationInNode(self)
            let touchNode = nodeAtPoint(location)
            
            if touchNode .hasActions() {
                touchNode.actionForKey("move")
            }
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            let touchNode = nodeAtPoint(location)
            var name = touchNode.name
            
            posicaoFinal = location

            for node in soldierGroup.children {
                
                var animacao = node as! soldierNode
                
                animacao.animationWalk(posicaoFinal.x)
            }
            
        }
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }


}
