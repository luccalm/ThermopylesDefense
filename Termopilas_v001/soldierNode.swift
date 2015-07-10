//
//  Player1.swift
//  Termopilas_v001
//
//  Created by Leonardo Rubio 1 on 08/07/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit


class soldierNode: SKSpriteNode {
    
    var respirandoLancaAtlas = SKTextureAtlas(named: "respirandoLanca") // cria o atlas de animacao
    var andandoLancaAtlas = SKTextureAtlas(named: "andandoLanca") // cria o atlas de animacao

    
    //Textures
    var respirandoLancaTexture = [SKTexture]()
    var andandoLancaTexture = [SKTexture]()
    
    
    var animationRespirando : SKAction!
    
    init() {
        
        var texture = SKTexture(imageNamed: "respirandolanca_00000")
       
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        
        initAnimacao()
        
    }
    
    private func initAnimacao() {
        
        for index in 0...(respirandoLancaAtlas.textureNames.count - 1) {
            
            var texture = String (format: "respirandolanca_0000%d", index)
            
            respirandoLancaTexture += [respirandoLancaAtlas.textureNamed(texture)]
        }
        
        for index in 0 ... (andandoLancaAtlas.textureNames.count - 1) {
            
            var texture = String (format: "andandocomLanca_0000%d", index)
            
            andandoLancaTexture += [andandoLancaAtlas.textureNamed(texture)]
        }
        
        
        
    }
    
    
    func animationTest () {
        
        let animate = SKAction.animateWithTextures(respirandoLancaTexture,
            timePerFrame: 0.05)
        self.runAction(SKAction.repeatActionForever(animate))
        
    }
    
    func animationWalk(posicaoFinal : CGFloat) {
    
        
        var andarAction = SKAction.moveToX(posicaoFinal, duration: 5)

        let animate = SKAction.animateWithTextures(andandoLancaTexture, timePerFrame: 0.1)

        var walkAnimation = SKAction.repeatActionForever(animate)
        
        
        self.runAction(walkAnimation)
        self.runAction(andarAction, completion: { () -> Void in
            self.removeAllActions()
            self.animationTest()
        })
        
    }
    


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



