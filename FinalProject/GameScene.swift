//
//  GameScene.swift
//  FinalProject
//
//  Created by Predko Brown Marya C. on 4/26/18.
//  Copyright © 2018 Predko Brown Marya C. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let background = SKSpriteNode(imageNamed: "squareF")
    
    let pX: CGFloat = 400
    let pY: CGFloat = 400
    
    let sW: CGFloat = 10
    let sH: CGFloat = 10
    
    //    let randValX: CGFloat = CGFloat((arc4random()%1500)+1)
    //    let randValY: CGFloat = CGFloat((arc4random()%2000)+1)


    var randValX = CGFloat((arc4random()%1500)+1)
    var randValY = CGFloat((arc4random()%2000)+1)
    
    let triangle = Triangle(position: CGPoint(x: 400, y: 400),size: CGSize(width: 10, height: 10))
    //let dot = Dot(position: CGPoint(x: randValX, y: randValY), size: CGSize(width: 4, height: 4))
    let dot = Dot(position: CGPoint(x: 0, y: 0))
    let tSpeed:CGFloat = 10.0
    
    let score_label = SKLabelNode(fontNamed: "STHeitiTC-Medium")
    let score_value = SKLabelNode(fontNamed: "STHeitiTC-Medium")
    let score_counter = 0
    //    //Gets screen size based on device orientation
    //    let screenWidth  = UIScreen.main.bounds.width
    //    let screenHeight = UIScreen.main.bounds.height
    //    //Gives screen size in pixels rather than points
    let screenWidthInPixels = UIScreen.main.nativeBounds.width
    let screenHeightInPixels = UIScreen.main.nativeBounds.height

    var xr = 0
    var yr = 0
    
    // Create and configure the scene.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func didMove(to view: SKView) {
        
//            xr = CGFloat(max(CGFloat(dot.frame.size.width) , CGFloat(xr))) // left edge detect
//            xr = MIN(image.superview.frame.size.width - image.frame.size.width , xr); //right edge detect
//
//            yr = MAX(image.frame.size.height , yr); //  top edge detect
//            yr = MIN(image.superview.frame.size.height - image.frame.size.height , yr); //bottom edge detect
//        dot.position = CGPoint(x: randValX, y: randValY)
        dot.position = CGPoint(x: randValX, y: randValY)
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
    }
    
    
    
    // code basis borrowed from https://stackoverflow.com/questions/36230619/how-to-move-enemy-towards-a-moving-player
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            
            //Aim
            let dx = location.x - triangle.position.x
            let dy = location.y - triangle.position.y
            let angle = atan2(dy, dx)
            
            //triangle.zRotation = angle+3.14/2;
            triangle.zRotation = angle+3.14/2;
            //Seek
            //            let vx = cos(angle+3.14/2) * tSpeed
            //            let vy = sin(angle+3.14/2) * tSpeed
            let vx = cos(angle) * tSpeed
            let vy = sin(angle) * tSpeed
            triangle.position.x += vx
            triangle.position.y += vy
        }
        
        
    }
    
//    var entities = [GKEntity]()
//    var graphs = [String : GKGraph]()
    
//    private var lastUpdateTime : TimeInterval = 0
//    private var label : SKLabelNode?
//    private var spinnyNode : SKShapeNode?
//
//    override func sceneDidLoad() {
//
//        self.lastUpdateTime = 0
//
//        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
//
//        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
//    }
//
    
//    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//    }
//
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//
//    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//
//    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//
//        // Initialize _lastUpdateTime if it has not already been
//        if (self.lastUpdateTime == 0) {
//            self.lastUpdateTime = currentTime
//        }
//
//        // Calculate time since last update
//        let dt = currentTime - self.lastUpdateTime
//
//        // Update entities
//        for entity in self.entities {
//            entity.update(deltaTime: dt)
//        }
//
//        self.lastUpdateTime = currentTime
//    }
}
