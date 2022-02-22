import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as! SKView? {
            let scene = MenuScene(size: UIScreen.main.bounds.size)
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
 
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }

//    static func lol(){
//        print("lol")
//        let urlAsk = "https://forms.gle/JhmiHZDeXRoQDeGt5"
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "SupportViewController") as! SupportViewController
//        vc.url =  URL(string: urlAsk)
//    
//        
//        vc.backToGame = true
//        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .fullScreen
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        //show window
//        appDelegate.window?.rootViewController = vc
//    }
//    
//    static func lol2(){
//        let urlAsk = "https://forms.gle/JhmiHZDeXRoQDeGt5"
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "SupportViewController") as! SupportViewController
//        vc.url =  URL(string: urlAsk)
//    
//        
//        vc.backToGame = true
//        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .fullScreen
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        //show window
//        appDelegate.window?.rootViewController = vc
//    }
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
