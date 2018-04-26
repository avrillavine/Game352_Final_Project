//
//  ButtonSprite.swift
//  FinalProjectDemo
//
//  Created by Marya Predko Brown on 2018-04-26.
//  Copyright © 2018 Marya Predko Brown. All rights reserved.
//

import Foundation
import SpriteKit

class ButtonSprite: SKSpriteNode {
    
    let buttonPressed: () -> ()
    
    init(texture: SKTexture?, color: UIColor, size: CGSize,text: String,buttonPressed: @escaping () -> ()) {
        self.buttonPressed = buttonPressed
        super.init(texture: texture, color: color, size: size)
        
        let label = SKLabelNode(fontNamed:"STHeitiTC-Medium")
        label.fontSize = 50
        label.fontColor = SKColor.black
        label.position = CGPoint.init(x: 0.0,y:0.0)
        label.zPosition = 1
        label.verticalAlignmentMode = .center
        label.text = text
        self.addChild(label)
        
        self.isUserInteractionEnabled = true
        
        let shape = SKShapeNode()
        shape.path = UIBezierPath(roundedRect: CGRect(x: -70, y: -30.2, width: 142, height: 60), cornerRadius: 64).cgPath
        //shape.path = UIBezierPath(roundedRect: CGRect(x:(label.frame.origin.x), y:-30.2, width: (label.frame.size.width)+30, height: (label.frame.size.height) + 50 ), cornerRadius: 64).cgPath
//        shape.path = UIBezierPath(roundedRect: CGRect(x:(label.frame.origin.x) - 15, y: (label.frame.origin.y) - 15, width: ((label?.frame.size.width)+30), height: ((label.frame.size.height) + 50 )), cornerRadius: 64).cgPath
        shape.position = CGPoint(x: label.position.x, y: label.position.y)
        shape.fillColor = UIColor.clear
        shape.strokeColor = UIColor.darkGray
        shape.lineWidth = 4
        addChild(shape)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.alpha = 0.8
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.alpha = 1.0
        buttonPressed()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

