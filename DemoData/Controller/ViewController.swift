//
//  ViewController.swift
//  DemoData
//
//  Created by Raunak Sinha on 20/05/21.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    let manager = NameManager()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "animationSegue", sender: self)
    }
}

