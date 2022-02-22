import SpriteKit

class GreenPowerUp: PowerUp {
    init(){
        let texture = SKTexture(imageNamed: "boom")
        super.init(textureNode: texture)
        name = "greenPowerUp"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
