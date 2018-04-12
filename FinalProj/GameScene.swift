import SpriteKit

class GameScene: SKScene {
    
    var db: MyDatabase = MyDatabase()
    let background = SKSpriteNode(imageNamed: "squareF")
    
    let pX: CGFloat = 400
    let pY: CGFloat = 400
    
    let sW: CGFloat = 10
    let sH: CGFloat = 10
    
    let triangle = Triangle(position: CGPoint(x: 400, y: 400),size: CGSize(width: 10, height: 10))
    let tSpeed:CGFloat = 10.0
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        addChild(background)
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
            
           triangle.zRotation = angle
            //Seek
            let vx = cos(angle+3.14/2) * tSpeed
            let vy = sin(angle+3.14/2) * tSpeed
            
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
