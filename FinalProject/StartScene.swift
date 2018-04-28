//
//  StartScene.swift
//  FinalProj
//
//  Created by Predko Brown Marya C. on 4/19/18.
//  Copyright © 2018 Predko Brown Marya C. All rights reserved.
//
//
//  StartScene.swift
//  FinalProj
//
//  Created by Predko Brown Marya C. on 4/19/18.
//  Copyright © 2018 Predko Brown Marya C. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class StartScene: SKScene {
    
    let screenWidthInPixels = UIScreen.main.nativeBounds.width
    let screenHeightInPixels = UIScreen.main.nativeBounds.height
    

    override func didMove(to view: SKView) {
        // set the background color
        backgroundColor = SKColor.white
        
        let play_button = ButtonSprite(texture: nil, color: .white, size: CGSize.init(width: 180, height: 80), text: "Play", buttonPressed: playButton)
        play_button.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(play_button)
        
//      UIButton implemented to demonstrate UIbutton capabilities for menu navigation purposes
//        let play_button:UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
//      COULD NOT ADD UIBUTTON IN FINAL PRODUCT DUE TO DIFFICULTIES IN MANAGING IT'S FUNCTIONS
        //for example it would stay on the screen after a transiton
//        let play_button:UIButton = UIButton(frame: CGRect(x: 200, y: 230, width: 180, height: 80))
//        play_button.center = CGPoint(x: self.frame.midX, y: self.frame.midY)
//        play_button.backgroundColor = .gray
//        play_button.setTitle("Play", for: .normal)
//        play_button.setTitleColor(.black, for: .normal)
//      The idea behind the below code was to make the button look more like the help one but the layer stayed with
//      the next scene. So I had to take it out.
//        play_button.layer.cornerRadius = 5
//        play_button.layer.borderWidth = 1
//        play_button.layer.borderColor = UIColor.black.cgColor
//        play_button.addTarget(self, action: #selector(playButton), for: .touchUpInside)
//        
//        self.view!.addSubview(play_button)
        
        let help_button = ButtonSprite(texture: nil, color: .white, size: CGSize.init(width: 180, height: 80), text: "Help", buttonPressed: helpButton)
        help_button.position = CGPoint(x: self.frame.midX, y: self.frame.midY-180)
        self.addChild(help_button)
    }
    func playButton()
    {
        let gameScene = GameScene(size: CGSize(width: screenWidthInPixels, height: screenHeightInPixels))
        let reveal = SKTransition.crossFade(withDuration: 2)
        // transition from current scene to the new scene
        view!.presentScene(gameScene, transition: reveal)
    }
    
//    @objc func playButton(sender: UIButton!) {
//
//        let gameScene = GameScene(size: CGSize(width: screenWidthInPixels, height: screenHeightInPixels))
//        let reveal = SKTransition.crossFade(withDuration: 2)
//        // transition from current scene to the new scene
//        view!.presentScene(gameScene, transition: reveal)
//    }
    func helpButton() {
        let helpScene = HelpScene(size: CGSize(width: screenWidthInPixels, height: screenHeightInPixels))
        let reveal = SKTransition.crossFade(withDuration: 2)
        // transition from current scene to the new scene
        view!.presentScene(helpScene, transition: reveal)
    }

    
}


