import UIKit

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        router(true)
    }
    
    func router(_ game: Bool){
        if game {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
            UIView.transition(with: self.view!, duration: 0.0, options: .transitionFlipFromRight, animations:
            {
                self.view?.window?.rootViewController = vc
            })
        }
    }
    

}
