import SpriteKit

class GameScene: SKScene {
    
    var db: MyDatabase = MyDatabase()
    let background = SKSpriteNode(imageNamed: "squareF")
    
    let pX: CGFloat = 400
    let pY: CGFloat = 400
    
    let sW: CGFloat = 10
    let sH: CGFloat = 10
    
    let randValX = (arc4random()%1500)+1
    let randValY = (arc4random()%2000)+1
    
    let randX: CGFloat(randValX)
    let randY: CGFloat(randValY)
    let triangle = Triangle(position: CGPoint(x: 400, y: 400),size: CGSize(width: 10, height: 10))
    let dot = Dot(position: CGPoint(x: randValX, y: randValY), size CGSize(width: 4, height: 4))
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
    // Create and configure the scene.
    
    override func didMove(to view: SKView) {
        
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
        db.requestStats(for: "") { arg1 in
            print(arg1)
        }
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
    
  

    /*    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     super.touchesBegan(touches, with: event)
     
     guard touches.first != nil else{
     return
     }
     //    cclady.touchPoint = touch.location(in: self)
     //     if let touch = touches.first {
     //        crazycatlady.touchPoint = touch
     //     }
     
     if let touch = touches.first {
     
     let location = touch.location(in: self)
     
     //Aim
     let dx = location.x - crazycatlady.position.x
     let dy = location.y - crazycatlady.position.y
     let angle = atan2(dy, dx)
     
     crazycatlady.zRotation = angle
     
     }
     }*/
    
}
