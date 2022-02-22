//
//  Router.swift
//  Space Shot
//
//  Created by Roma on 22.02.2022.
//

import UIKit

class Router {
    private init(){}
    static let shared = Router()
    
    func goToSupport(view: UIView){
        let urlAsk = "https://forms.gle/JhmiHZDeXRoQDeGt5"
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SupportViewController") as! SupportViewController
        
        vc.url =  URL(string: urlAsk)
        vc.backToGame = true

        UIView.transition(with: view, duration: 0.3, options: .transitionFlipFromRight, animations: {
            view.window?.rootViewController = vc
        })
    }
}
