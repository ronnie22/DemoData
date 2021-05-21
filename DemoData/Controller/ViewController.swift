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
        if let email = emailTextField.text {
            if let pass = passwordTextField.text {
                if pass == "Abc00011" && email == "abc@xyz.test" {
                    performSegue(withIdentifier: "animationSegue", sender: self)
                }else{
                    showNotification()
                }
            }else{
                showNotification()
            }
        }else{
            showNotification()
        }
        
    }
    
    func showNotification() {
        let alert = UIAlertController(title: "Wrong Email or Password", message: "Please enter valid password", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

