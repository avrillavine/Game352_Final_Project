//
//  BasicGameObject.swift
//  FinalProj
//
//  Created by Predko Brown Marya C. on 4/12/18.
//  Copyright © 2018 Predko Brown Marya C. All rights reserved.
//
import SpriteKit

enum CollisionTypes: UInt32 {
    case player = 1
    case enemy = 2
    case dot = 3

}

class BasicGameObject: SKSpriteNode {
    //movement
//    let collectDot: SKAction = {
//        let growAndFadeAction = SKAction.group([SKAction.scale(to: 50, duration: 0.5),
//                                                SKAction.fadeOut(withDuration: 0.5)])
//        
//        let sequence = SKAction.sequence([growAndFadeAction,
//                                          SKAction.removeFromParent()])
//        
//        return sequence
//    }()
//
//    func didBegin(_ contact: SKPhysicsContact) {
//        if contact.collisionImpulse > 5 &&
//            contact.bodyA.node?.name == "triangle" &&
//            contact.bodyB.node?.name == "dot" {
//            
//            let shockwave = SKShapeNode(circleOfRadius: 10)
//            
//            shockwave.position = contact.contactPoint
//            scene?.addChild(shockwave)
//            print("Hit")
//            shockwave.run(collectDot)
//        }
//    }
}

