//
//  HUD.swift
//  gametest1
//
//  Created by Roma Bogatchuk on 09.01.2022.
//

import SpriteKit

class HUD: SKNode {
    //елементы интерфейса
    
    let scoreBackground = SKSpriteNode(imageNamed: "scores")
    let scoreLabel = SKLabelNode(text: "0")
    let menuButton = SKSpriteNode(imageNamed: "menu")
    let life1 = SKSpriteNode(imageNamed: "life")
    let life2 = SKSpriteNode(imageNamed: "life")
    let life3 = SKSpriteNode(imageNamed: "life")
    
    var score = 0 {
        //наблюдатель за количеством жизней
        didSet {
            scoreLabel.text = score.description
        }
    }
    
    func configureUI(screenSize: CGSize){
        //фон очков
        scoreBackground.position = CGPoint(x: scoreBackground.size.width / 2 + 10, y: screenSize.height - scoreBackground.size.height / 2 - 15 )
        scoreBackground.anchorPoint = CGPoint(x: 1.0, y: 0.5)// начало кординат с лева по середине
        scoreBackground.zPosition = 99
        scoreBackground.setScale(0.5)
        addChild(scoreBackground)
        
        scoreLabel.horizontalAlignmentMode = .right // выравнивание по горизонтале по отношению к родителю по правую часть
        scoreLabel.verticalAlignmentMode = .center // выравнивание по вертикале по отношению к родителю
        scoreLabel.position = CGPoint(x: -(scoreBackground.size.width / 3), y: 3)
        scoreLabel.zPosition = 100
        scoreLabel.fontName = "Saira ExtraCondensed Black"//шрифт
        scoreLabel.fontSize = 40//размер шрифта
        scoreLabel.fontColor = .black
        //scoreLabel.setScale(0.5)
        scoreBackground.addChild(scoreLabel)//добавляем лайбл к фону
        
        menuButton.position = CGPoint(x: 20, y: 20)
        menuButton.anchorPoint = CGPoint(x: 0.0, y: 0.0)// начало координат в левом нижнем угле
        menuButton.zPosition = 100
        menuButton.name = "pause"
        menuButton.setScale(0.3)
        
        addChild(menuButton)
        
        let lifes = [life1, life2, life3]
        for (index, life) in lifes.enumerated() { //  enumerated() возвращает индекс и элемент массива
            //
            
            life.zPosition = 100
            life.anchorPoint = CGPoint(x: 0.0, y: 0.0) // начало координат в левом нижнем угле
            life.setScale(0.2)
            life.position = CGPoint(x: screenSize.width - CGFloat(index + 1) * (life.size.width + 3), y: 20)
            addChild(life)
        }
    }
}
