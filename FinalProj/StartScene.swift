//
//  StartScene.swift
//  FinalProj
//
//  Created by Predko Brown Marya C. on 4/19/18.
//  Copyright © 2018 Predko Brown Marya C. All rights reserved.
//

import Foundation
import SpriteKit
class StartScene: SKScene {
    
    let play_button = SKLabelNode(fontNamed: "STHeitiTC-Medium")
    let screenWidthInPixels = UIScreen.main.nativeBounds.width
    let screenHeightInPixels = UIScreen.main.nativeBounds.height
    override func didMove(to view: SKView) {
        // set the background
        //_ = SKColor.white
        backgroundColor = SKColor.white
        // set size, color, position and text of the tapStartLabel
        play_button.fontSize = 16
        play_button.fontColor = SKColor.black
        play_button.horizontalAlignmentMode = .center
        play_button.verticalAlignmentMode = .center
        play_button.position = CGPoint(
            x: size.width / 2,
            y: size.height / 2
        )
        play_button.text = "Tap to Play"
        let shape = SKShapeNode()
        shape.path = UIBezierPath(roundedRect: CGRect(x: -70, y: -25, width: 142, height: 55), cornerRadius: 64).cgPath
        shape.position = CGPoint(x: play_button.position.x, y: play_button.position.y)
        shape.fillColor = UIColor.clear
        shape.strokeColor = UIColor.darkGray
        shape.lineWidth = 4
        addChild(shape)
        //SKShapeNode.init(ellipseIn: CGRect.init(origin: play_button.position, size: CGSize(width: 6, height: 6)))
        
        // add the label to the scene
        addChild(play_button)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let gameScene = GameScene(size: CGSize(width: screenWidthInPixels, height: screenHeightInPixels))
//        gameScene.scaleMode = scaleMode
//        gameScene.scaleMode.rawVa
        
        // use a transition to the gameScene
        //let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
        let reveal = SKTransition.crossFade(withDuration: 2)
        // transition from current scene to the new scene
        view!.presentScene(gameScene, transition: reveal)
    }
}
