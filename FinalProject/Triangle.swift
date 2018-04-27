//
//  Triangle.swift
//  FinalProj
//
//  Created by Predko Brown Marya C. on 4/12/18.
//  Copyright © 2018 Predko Brown Marya C. All rights reserved.
//

import Foundation
import SpriteKit

class Triangle: BasicGameObject {
    var text = ""
    //init(name sprName: String, position: CGPoint, size: CGSize ){
    init(position: CGPoint, size: CGSize ){
        let texture = SKTexture(imageNamed: "triangle2")
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        self.position = position
        self.zPosition = 1
        self.name = "triangle"
        self.physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = CollisionTypes.player.rawValue
        self.physicsBody?.contactTestBitMask = CollisionTypes.dot.rawValue
        self.physicsBody?.collisionBitMask = 0
       // self.physicsBody?.usesPreciseCollisionDetection = true
        
    }
    func destroy(){
        self.removeFromParent()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*    func MoveTowards() {
     var posX = 0
     var posY = 0
     
     
     }*/
    
}


