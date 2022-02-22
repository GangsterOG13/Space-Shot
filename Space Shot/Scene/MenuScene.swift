
import SpriteKit

class MenuScene: PerentScene {
    override func didMove(to view: SKView) {
        
        if !Assets.shared.isLoaded{
            Assets.shared.preloadAssets()//подгрузка всех текстур
            Assets.shared.isLoaded = true
        }
       
        let background = SKSpriteNode(imageNamed: "backgroundMenu3")
        background.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        background.size = self.size // растянули фон на весь экран
        background.zPosition = 1
        self.addChild(background) // добавили фон на нашу сцену
        
        setHeader(withName: nil, andBackground: "header1", positionY: 150)
        
        let titles = ["play", "options", "best", "info"] // текст для кнопок
        
        for (index, title) in titles.enumerated() {
            
            let button = ButtonNode(titled: title, backgroundName: "button_background", fontSize: nil)
            button.position = CGPoint(x: self.frame.midX, y: (self.frame.midY ) - CGFloat(80 * index))
            button.name = title
            button.zPosition = 2
           // button.setScale(0.3)
            button.label.name = title // такео же имя как и у самой кнопки что бы при нажатии все работало
            addChild(button)
            
        }
        
        let supportButton = ButtonNode(titled: "?", backgroundName: "button_background", fontSize: 40)
        
        supportButton.position = CGPoint(x: self.frame.minX + 50, y: self.frame.maxY - 50)
        supportButton.size.width = supportButton.size.height
        supportButton.zPosition = 2
        supportButton.name = "support"
        supportButton.label.name = "support"
        supportButton.setScale(0.7)
        addChild(supportButton)
//

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let location = touches.first!.location(in: self)//получаем кординаты касания
        let node = self.atPoint(location)//получаем нод по которому пришло касание
        let transition = SKTransition.crossFade(withDuration: 1.0)// эфект для перехода на другую сцену
        //если нод которое коснулись кнопка то играем
        if node.name == "play" {
          
            let gameScene = GameScene(size: self.size)//сцена на которую будем переходить
            gameScene.scaleMode = .aspectFill // на весь экран
            self.scene?.view?.presentScene(gameScene, transition: transition)//сам переход
            
        } else if node.name == "options" {
            
            let optionsScene = OptionsScene(size: self.size)
            optionsScene.backScene = self // устанавливаем эту сцену для кнопки back  с момощу которой мы вернемся
            optionsScene.scaleMode = .aspectFill // на весь экран
            self.scene?.view?.presentScene(optionsScene, transition: transition)//сам переход
            
        } else if node.name == "best" {
            
            let bestScene = BestScene(size: self.size)
            bestScene.backScene = self // устанавливаем эту сцену для кнопки back  с момощу которой мы вернемся
            bestScene.scaleMode = .aspectFill // на весь экран
            self.scene?.view?.presentScene(bestScene, transition: transition)//сам переход
            
        }else if node.name == "info" {
            
            let infoScene = InfoScene(size: self.size)
            infoScene.backScene = self // устанавливаем эту сцену для кнопки back  с момощу которой мы вернемся
            infoScene.scaleMode = .aspectFill // на весь экран
            self.scene?.view?.presentScene(infoScene, transition: transition)//сам переход
            
        }else if node.name == "support" {
           
            Router.shared.goToSupport(view: self.view!)
  
        }
    }
}
