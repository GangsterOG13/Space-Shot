import SpriteKit

class BluePowerUp: PowerUp {
    init(){
        let texture = SKTexture(imageNamed: "bonus")
        super.init(textureNode: texture)
        name = "bluePowerUp"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
