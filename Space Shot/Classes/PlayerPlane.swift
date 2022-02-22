import SpriteKit
import CoreMotion

class PlayerPlane: SKSpriteNode {
    
    let motionManager = CMMotionManager() // менеджер для аксилиратора/ повороты устройства
    var xAcceleration: CGFloat = 0// поворот для скорости
    let screenSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height) // размер экрана
    var leftTextureArrayAnimation = [SKTexture]()//масивы для анимации
    var rightTextureArrayAnimation = [SKTexture]()
    var forwardTextureArrayAnimation = [SKTexture]()
    var moveDirection: TurnDirection = .none // направление полета
    var stillTurning = false // закончилась ли анимация?
    let animationSpriteStrides = [(1, 9, 1), (5, 9, 1), (5, 5, 1)]
    //создаем самалет
    static func populate(at point: CGPoint) -> PlayerPlane{
        let atlas = Assets.shared.playerPlaneAtlas
        let playerPlaneTexture = atlas.textureNamed("rocket_05") //SKTexture(imageNamed: "airplane_3ver2_13")
        let playerPlane = PlayerPlane(texture: playerPlaneTexture)
        playerPlane.setScale(0.25)
        playerPlane.position = point
        playerPlane.zPosition = 40
        
        
        // создаем физическое тело с уровнем прозрачности для боле приблеженой формы нода
        playerPlane.physicsBody = SKPhysicsBody(texture: playerPlaneTexture, alphaThreshold: 0.5, size: playerPlane.size)
        playerPlane.physicsBody?.isDynamic = false // что бы при взаимодействии с другими обьектами самолет был как стена
        playerPlane.physicsBody?.categoryBitMask = BitMackCategory.player.rawValue //категория битовой маски
        playerPlane.physicsBody?.collisionBitMask = BitMackCategory.enemy.rawValue | BitMackCategory.powerUp.rawValue // обьекты с которыми будем сталкиваться
        playerPlane.physicsBody?.contactTestBitMask = BitMackCategory.enemy.rawValue | BitMackCategory.powerUp.rawValue // регистрация столкнования с обьектами
        
        return playerPlane
    }
    
    //проверка уходит ли самолет за граници
    func checkPosition() {
        
        self.position.x += xAcceleration * 50
        
        if self.position.x < -50 {
            self.position.x = screenSize.width + 50
        } else if self.position.x > screenSize.width + 50 {
            self.position.x = -50
        }
    }
    // основной метод  анимация и полет
    func performFly() {
       // planeAnimationFillArray()
        preloadTextureArrays()
        //управление с помощью акселирометра
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { [unowned self] (data, error) in
            if let data = data {
                let acceleration = data.acceleration
                self.xAcceleration = CGFloat(acceleration.x) * 0.7 + self.xAcceleration * 0.3
            }
        }
        
       // let planeWaitAction = SKAction.wait(forDuration: 1.0)
//        let planeDirectionCheckAction = SKAction.run { [unowned self] in
//            self.movementDirectionCheck()
//        }
//        let planeSequence = SKAction.sequence([planeWaitAction, planeDirectionCheckAction])
//        let planeSequenceForeve = SKAction.repeatForever(planeSequence)
       // self.run(planeWaitAction)
        turnPlane(direction: moveDirection)
        
    }
    
  

    fileprivate func preloadTextureArrays() {
        
        var array = [SKTexture]()
        for i in stride(from: 1, through: 9, by: 1) {
            let number = String(format: "%02d", i)
            let texture = SKTexture(imageNamed: "rocket_\(number)")
            array.append(texture)
            
        }
        self.forwardTextureArrayAnimation = array
    }

    //определяет вкакую сторону запускать анимацию

    //запуск анимации
    fileprivate func turnPlane(direction: TurnDirection) {// анимация
        
        var array = [SKTexture]()
        for i in 1...10 {
            let number = String(format: "%02d", i)
            array.append(SKTexture(imageNamed: "rocket_\(number)"))
        }
       
       // array = forwardTextureArrayAnimation
        
        //загружаем текстуры
        SKTexture.preload(array){
            let rotation = SKAction.animate(with: array, timePerFrame: 0.05, resize: true, restore: false)// анимируем спрайт
            let rotationForever = SKAction.repeatForever(rotation) // бесконечная анимация
            self.run(rotationForever) // запускаем анимацию
        }
//        //анимация в одну сторону (масив / интервал на каждый кадр/размер текстуры в зависимотсти от экрана/возврат к первому кадру)
//        let forwardAction = SKAction.animate(with: array, timePerFrame: 0.05, resize: true, restore: false)
//        //возврат в прежнее положение
//       // let backwardAction = SKAction.animate(with: array.reversed(), timePerFrame: 0.05, resize: true, restore: false)
//
//        let foreverAction = SKAction.repeatForever(forwardAction)
//        self.run(foreverAction)
        
    }
    
    func greenPowerUp() {
        let colorAction = SKAction.colorize(with: .green, colorBlendFactor: 1.0, duration: 0.2)
        let uncolorAction = SKAction.colorize(with: .green, colorBlendFactor: 0.0, duration: 0.2)
        let sequenceAction = SKAction.sequence([colorAction, uncolorAction])
        let repeatAction = SKAction.repeat(sequenceAction, count: 5)
        self.run(repeatAction)
    }
    
    func bluePowerUp() {
        let colorAction = SKAction.colorize(with: .blue, colorBlendFactor: 1.0, duration: 0.2)
        let uncolorAction = SKAction.colorize(with: .blue, colorBlendFactor: 0.0, duration: 0.2)
        let sequenceAction = SKAction.sequence([colorAction, uncolorAction])
        let repeatAction = SKAction.repeat(sequenceAction, count: 5)
        self.run(repeatAction)
    }
    
}
//определяем поворот
enum TurnDirection {
    case left
    case right
    case none
}
