//
//  GameViewController.swift
//  FinalProj
//
//  Created by Predko Brown Marya C. on 4/5/18.
//  Copyright © 2018 Predko Brown Marya C. All rights reserved.
//
import UIKit
import SpriteKit
class GameViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let scene = StartScene(size: (view?.bounds.size)!)
//        //let scene = GameScene(size: CGSize(width: 2048, height: 1536))
//        let skView = self.view as! SKView
//        skView.showsFPS = true
//        skView.showsNodeCount = true
//        skView.ignoresSiblingOrder = true
//        scene.scaleMode = .aspectFill
//        skView.presentScene(scene)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = StartScene(size: (view?.bounds.size)!)

        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true

        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true

        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .resizeFill

        skView.presentScene(scene)

    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

