//
//  PowerUp.swift
//  FinalProject
//
//  Created by Marya Predko Brown on 2018-04-27.
//  Copyright © 2018 Predko Brown Marya C. All rights reserved.
//

import Foundation
import SpriteKit
//For triangle to collect and score points
class PowerUp: BasicGameObject {
    
    private var powerUp = SKSpriteNode()
    private var powerUpPulsingFrames: [SKTexture] = []
    
//    init(position: CGPoint){
//        let texture = sk
//        super.init(powerUpPulsingFrames,)
//    }
    init(position: CGPoint){
//        let powerUpTexture = SKTextureAtlas(named: "PowerUp")
//        super.init(texture: powerUpPulsingFrames, color: .clear, size: powerUpPulsingFrames)
//        var pulseFrames: [SKTexture] = []
//
//        let numOfFrames = powerUpTexture.textureNames.count
//        for i in 1...numOfFrames {
//            let powerUpTextureName = "powerUP\(i)"
//            pulseFrames.append(powerUpTexture.textureNamed(powerUpTextureName))
//        }
//        powerUpPulsingFrames = pulseFrames
//
//        let firstFrameTex = powerUpPulsingFrames[0]
//        powerUp = SKSpriteNode(texture: firstFrameTex)
//

        let atlas = SKTextureAtlas(named: "PowerUp")
        let f1 = atlas.textureNamed("powerUp0.png")
        let f2 = atlas.textureNamed("powerUp1.png")
        let f3 = atlas.textureNamed("powerUp2.png")
        let f4 = atlas.textureNamed("powerUp3.png")
        let powerUpPulsingFrames = [f1,f2,f3,f4]
        super.init(texture: powerUpPulsingFrames[0], color: .clear, size: powerUpPulsingFrames[0].size())
        powerUp.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(powerUp)
        
    }

    func animatePowerUp() {
        powerUp.run(SKAction.repeatForever(SKAction.animate(with: powerUpPulsingFrames, timePerFrame: 0.1, resize: false, restore: true)) , withKey:"movingInPlaceFrame")
    }
//    init(position: CGPoint){
//        super.init(powerUp)
//        powerUp.position = position
//    }

    func destroy(){
        self.removeFromParent()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
