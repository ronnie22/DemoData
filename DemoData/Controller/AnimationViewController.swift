//
//  AnimationViewController.swift
//  DemoData
//
//  Created by Raunak Sinha on 21/05/21.
//

import UIKit
import Lottie

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimation()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    
    func showAnimation() {
        
        let jsonName = "tick"
        
        let animation = Animation.named(jsonName)

        let animationView = AnimationView(animation: animation)
        
        animationView.contentMode = .scaleAspectFit
       
        animationView.frame = CGRect(x: view.frame.width/2 - 100, y: view.frame.height/2 - 100, width: 200, height: 200)

        view.addSubview(animationView)

        animationView.play()
        
        let secondsToDelay = 1.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
            self.performSegue(withIdentifier: "DetailViewSegue", sender: self)
        }
        
    }

}
