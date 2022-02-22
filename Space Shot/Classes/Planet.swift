import SpriteKit
import GameplayKit

final class Planet: SKSpriteNode, GameBackgroundSpriteable {
    
    static var movementSpeed: CGFloat = 100.0 // скорость движения
    
    static func populate(at point: CGPoint?) -> Planet {
        
        let planetImageName = configureName()// рандомное название
        let planet = Planet(imageNamed: planetImageName)//создаем спрайт
        planet.setScale(randomScaleFactor)// задаем рандомный размер
        planet.position = point ?? randomPoint()// позиция
        planet.zPosition = 1
        planet.name = "sprite"
        planet.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        planet.run(rotateForRandomAngle()) // поворачиваем остров
        planet.run(move(from: planet.position)) // движение острова
        return planet
        
    }
    //картинка  острова
    fileprivate static func configureName() -> String {
        
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 5) // объект с диапазоном для рандома
        let randomNumber = distribution.nextInt() // возвращает рандомное число 
        let imageName = "planet" + "\(randomNumber)"
        return imageName
        
    }
    //размер острова
    fileprivate static var randomScaleFactor: CGFloat {
        
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 10)
        let randomNumber = CGFloat(distribution.nextInt()) / 40
        return randomNumber
        
    }
    //поворот острова
    fileprivate static func rotateForRandomAngle() -> SKAction {
        
        let distribution = GKRandomDistribution(lowestValue: 0, highestValue: 360)
        let randomNumber = CGFloat(distribution.nextInt())
        return SKAction.rotate(byAngle: randomNumber * CGFloat(Double.pi / 180), duration: 0)
        
    }
    // движение острова
    fileprivate static func move(from point: CGPoint) -> SKAction{
        
        let movePoint = CGPoint(x: point.x, y: -200) // точка куда будет двигаться обьект
        let moveDistance = point.y + 200 // дистанция для нахождения скорости
        let duration = moveDistance / self.movementSpeed // время прохождения дистации
        return SKAction.move(to: movePoint, duration: TimeInterval(duration))
        
    }
    
}
