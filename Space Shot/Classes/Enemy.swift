
import SpriteKit

class Enemy: SKSpriteNode {
    
    static var textureAtlas: SKTextureAtlas?
    var enemyTexture: SKTexture!
    static var timeHorizontal = 3.0 // время полета по горизонтали
    static var timeVertical = 5.0 // время полета по вертикале
    
    fileprivate let screenSize = UIScreen.main.bounds
    
    init(enemyTexture: SKTexture) {
        let texture = enemyTexture
        super.init(texture: texture, color: .clear, size: CGSize(width: 221, height: 204))
        self.xScale = 0.4 // уменьшаем в два раза
        self.yScale = -0.4 // разварачиваем по оси y
        self.zPosition = 20
        self.name = "spriteEnemy"
        
        // создаем физическое тело с уровнем прозрачности для боле приблеженой формы нода
        self.physicsBody = SKPhysicsBody(texture: texture, alphaThreshold: 0.5, size: self.size)
        self.physicsBody?.isDynamic = true // что бы при взаимодействии с другими обьектами ldbufkcz
        self.physicsBody?.categoryBitMask = BitMackCategory.enemy.rawValue //категория битовой маски
        self.physicsBody?.collisionBitMask = BitMackCategory.none.rawValue // при столкновении ничего не делать
        self.physicsBody?.contactTestBitMask = BitMackCategory.player.rawValue | BitMackCategory.shot.rawValue // регистрация столкнования с обьектами
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func flySpiral() {
        
        // движение  в лево 50 это половина нашего спрайта самолета
        let moveLeft = SKAction.moveTo(x: 50, duration: Enemy.timeHorizontal)
        moveLeft.timingMode = .easeInEaseOut // плавное движение
        // движение  в право 50 это половина нашего спрайта самолета
        let moveRight = SKAction.moveTo(x: screenSize.width - 50, duration: Enemy.timeHorizontal)
        moveRight.timingMode = .easeInEaseOut
        
        let rundomNumer = Int(arc4random_uniform(2))
        
        let asideMovementSequence = rundomNumer == EnemyDirection.left.rawValue ? SKAction.sequence([moveLeft, moveRight]) : SKAction.sequence([moveRight, moveLeft])
       
        let asideMovementForever = SKAction.repeatForever(asideMovementSequence)
        
        
        let forwardMovement = SKAction.moveTo(y: -105, duration: Enemy.timeVertical) // движение по горизонтали
        let groupMovement = SKAction.group([asideMovementForever, forwardMovement]) // групировка акшенов
        self.run(groupMovement)
        
    }
}

enum EnemyDirection: Int {
    case left = 0
    case rigth
}
