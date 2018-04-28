//
//  Dot.swift
//  FinalProject
//
//  Created by Predko Brown Marya C. on 4/26/18.
//  Copyright © 2018 Predko Brown Marya C. All rights reserved.
//

import Foundation
import SpriteKit
//For triangle to collect and score points
class Dot: BasicGameObject {
    
    init(position: CGPoint){
        let texture = SKTexture(imageNamed: "circle")
        //super.init(texture: texture, color: UIColor.clear, size: texture.size())
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        self.position = position
        self.zPosition = 1
        self.name = "dot"
        self.size = CGSize(width: 100, height: 100)
        self.physicsBody = SKPhysicsBody(circleOfRadius: 47)
        self.physicsBody?.affectedByGravity = false
//        self.physicsBody?.categoryBitMask = CollisionTypes.dot.rawValue
//        self.physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
//        self.physicsBody?.collisionBitMask = 0
        //self.physicsBody?.usesPreciseCollisionDetection = true
    }
//    override func intersects(_ node: SKNode) -> Bool {
//        let t = Triangle(coder: SKNode)
//        self.removeFromParent()
//        _ = t
//        return self.intersects(t)
//    }
    func destroy(){
        self.removeFromParent()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

