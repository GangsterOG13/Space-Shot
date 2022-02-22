import SpriteKit

class Assets {
    
    static let shared = Assets()
    var isLoaded = false
    let yellowShotAtlas = SKTextureAtlas(named: "YellowAmmo")
    let enemy_1Atlas = SKTextureAtlas(named: "Enemy_1")
    let enemy_2Atlas = SKTextureAtlas(named: "Enemy_2")
    let enemy_3Atlas = SKTextureAtlas(named: "Enemy_3")
    let greenPowerUpAtlas = SKTextureAtlas(named: "GreenPowerUp")
    let bluePowerUpAtlas = SKTextureAtlas(named: "BluePowerUp")
    let playerPlaneAtlas = SKTextureAtlas(named: "PlayerPlane")
    
    func preloadAssets(){
        
        yellowShotAtlas.preload { print("yellowShotAtlas preload")}
        enemy_1Atlas.preload { print("enemy_1Atlas preload")}
        enemy_2Atlas.preload { print("enemy_2Atlas preload")}
        enemy_3Atlas.preload { print("enemy_3Atlas preload")}
        greenPowerUpAtlas.preload { print("greenPowerUpAtlas preload")}
        bluePowerUpAtlas.preload { print("bluePowerUpAtlas preload")}
        playerPlaneAtlas.preload { print("playerPlaneAtlas preload")}
        
    }
    
    
}
