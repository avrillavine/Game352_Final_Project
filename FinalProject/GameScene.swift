//
//  GameScene.swift
//  FinalProject
//
//  Created by Predko Brown Marya C. on 4/26/18.
//  Copyright © 2018 Predko Brown Marya C. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    let background = SKSpriteNode(imageNamed: "squareF")
    
    let pX: CGFloat = 400
    let pY: CGFloat = 400
    
    let sW: CGFloat = 10
    let sH: CGFloat = 10
    
    //    let randValX: CGFloat = CGFloat((arc4random()%1500)+1)
    //    let randValY: CGFloat = CGFloat((arc4random()%2000)+1)

    
   var lastUpdateTime: CFTimeInterval = 0 // Track the delta time
    
    let triangle = Triangle(position: CGPoint(x: 400, y: 400),size: CGSize(width: 10, height: 10))
    //let dot = Dot(position: CGPoint(x: randValX, y: randValY), size: CGSize(width: 4, height: 4))
    let dot = Dot(position: CGPoint(x: 0, y: 0))
    let tSpeed:CGFloat = 20.0
    
    let score_label = SKLabelNode(fontNamed: "STHeitiTC-Medium")
    let score_value = SKLabelNode(fontNamed: "STHeitiTC-Medium")
    var score_counter = 0
    //    //Gets screen size based on device orientation
    //    let screenWidth  = UIScreen.main.bounds.width
    //    let screenHeight = UIScreen.main.bounds.height
    //    //Gives screen size in pixels rather than points
    let screenWidthInPixels = UIScreen.main.nativeBounds.width
    let screenHeightInPixels = UIScreen.main.nativeBounds.height

    let screenWidth  = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
//    var randValX = CGFloat((arc4random()%1500)+1)
//    var randValY = CGFloat((arc4random()%2000)+1)


    // Create and configure the scene.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    //Code borrowed from https://stackoverflow.com/questions/1906511/how-to-find-the-distance-between-two-cg-points
    //gets distance between two points and converts to float
    func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        let xDist = a.x - b.x
        let yDist = a.y - b.y
        return CGFloat(sqrt((xDist * xDist) + (yDist * yDist)))
    }
  //  var cDistance: CGFloat = 0
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        
        let viewMidX = view.bounds.midX
        let viewMidY = view.bounds.midY
//        let sceneHeight = view.scene!.frame.height
//        let sceneWidth = view.scene!.frame.width
        let xPosition = view.scene!.frame.midX - viewMidX + CGFloat(arc4random_uniform(UInt32(viewMidX*2)))
        let yPosition = view.scene!.frame.midY - viewMidY + CGFloat(arc4random_uniform(UInt32(viewMidY*2)))

        dot.position = CGPoint(x: xPosition, y: yPosition)
        addChild(dot)
        score_label.fontSize = 80
        score_label.fontColor = SKColor.white
        score_label.horizontalAlignmentMode = .center
        score_label.verticalAlignmentMode = .center
        score_label.position = CGPoint(
            x: size.width/2,
            y: 2000
        )
        score_label.text = "Score: "
        addChild(score_label)
        
        score_value.fontSize = 80
        score_value.fontColor = SKColor.white
        score_value.horizontalAlignmentMode = .center
        score_value.verticalAlignmentMode = .center
        score_value.position = CGPoint(
            x: size.width/2 + 150,
            y: 2000
        )
        score_value.text = String(score_counter)
        addChild(score_value)
        
        backgroundColor = SKColor.black
        addChild(background)
        
        background.size = CGSize(width: screenWidthInPixels, height: screenHeightInPixels)
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition=(-5)
        
        addChild(triangle)
    
//        print(cDistance)
        //var distance: CGPoint = CGPoint(x: triangle.position.x-dot.position.x, y: triangle.position.y-dot.position.y)
        //var distanceY = triangle.position
//        print("distance x: ",distance.x)
//        print("distance y: ",distance.y)
        //distance between collectable and player's triangle

//        if(triangle.intersects(dot)){
//            dot.destroy()
//            print("Hit")
//        }
        

        
    }
    func didBeginContact(contact: SKPhysicsContact) {
//        if (contact.bodyA.node == triangle || contact.bodyB.node == dot) {
//            triangle.isHidden = true
//        }
//        var firstBody: SKPhysicsBody
//        var secondBody: SKPhysicsBody
//        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
//            firstBody = contact.bodyA
//            secondBody = contact.bodyB
//        } else {
//            firstBody = contact.bodyB
//            secondBody = contact.bodyA
//        }
//
//        if ((firstBody.categoryBitMask & CollisionTypes.dot.rawValue != 0) &&
//            (secondBody.categoryBitMask & CollisionTypes.player.rawValue != 0)) {
//            NSLog("Invader and Player Collision Contact")
//
//        }
//        if ((firstBody.categoryBitMask == CollisionTypes.dot.rawValue) && (secondBody.categoryBitMask == CollisionTypes.player.rawValue)){
//            print("Invader and Player Collision Contact")
//            score_counter += 1
//
//        }
        
    }
    // code basis borrowed from https://stackoverflow.com/questions/36230619/how-to-move-enemy-towards-a-moving-player
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            
            //Aim
            let dx = location.x - triangle.position.x
            let dy = location.y - triangle.position.y
            let angle = atan2(dy, dx)
            //Rotate to face target
            triangle.zRotation = angle+3.14/2;
            //Seek
            let vx = cos(angle) * tSpeed
            let vy = sin(angle) * tSpeed
            triangle.position.x += vx
            triangle.position.y += vy
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = max(1.0/30, currentTime - lastUpdateTime)
        lastUpdateTime = currentTime
        var cDistance:CGFloat = distance(triangle.position, dot.position)
        
        print(cDistance)
    
        if(cDistance<=60){
            print("Hit")
            dot.destroy()
            score_counter += 1
            //delete(dot)
        }
    }
}


