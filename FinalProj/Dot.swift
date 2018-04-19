//
//  Dot.swift
//  FinalProj
//
//  Created by Predko Brown Marya C. on 4/19/18.
//  Copyright © 2018 Predko Brown Marya C. All rights reserved.
//

import Foundation
import SpriteKit
//For triangle to collect and score points
class Dot: BasicGameObject {
    
    init(position: CGPoint, size: CGSize ){
        let texture = SKTexture(imageNamed: "circle")
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        self.position = position
        self.zPosition = 1
        self.name = "dot"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
