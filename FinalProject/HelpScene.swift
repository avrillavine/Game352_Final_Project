//
//  HelpScene.swift
//  FinalProject
//
//  Created by Predko Brown Marya C. on 4/26/18.
//  Copyright © 2018 Predko Brown Marya C. All rights reserved.
//
import Foundation
import SpriteKit
import GameplayKit
import UIKit
class HelpScene: SKScene {
    let background = SKSpriteNode(imageNamed: "squareF")
    
    let screenWidthInPixels = UIScreen.main.nativeBounds.width
    let screenHeightInPixels = UIScreen.main.nativeBounds.height

    let rules = SKLabelNode(fontNamed: "STHeitiTC-Medium")
    
    override func didMove(to view: SKView) {
        
        // set the background color
        backgroundColor = SKColor.white
        rules.fontSize = 40
        rules.fontColor = SKColor.black
        rules.horizontalAlignmentMode = .center
        rules.verticalAlignmentMode = .center
        rules.position = CGPoint(
            x: size.width/2,
            y: 1000
        )
        rules.numberOfLines = 2

        rules.text = "Move the triangle around by tapping the screen,\ncollect dots and score points. \nWatch out for enemies!(Enemies WIP) "
        addChild(rules)
        
        let return_button = ButtonSprite(texture: nil, color: .white, size: CGSize(width:  180, height: 80), text: "Back", buttonPressed: returnButton)
        return_button.position = CGPoint(x: self.frame.midX, y: self.frame.midY-400)
        self.addChild(return_button)

    }
    func returnButton() {
        let startScene = StartScene(size: CGSize(width: screenWidthInPixels, height: screenHeightInPixels))
        let reveal = SKTransition.crossFade(withDuration: 2)
        // transition from current scene to the new scene
        view!.presentScene(startScene, transition: reveal)
    }
}
