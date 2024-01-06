//
//  LoginViewController.swift
//  Resturant
//
//  Created by amro adil on 13/12/2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func showPasswordPress(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
    }
    @IBAction func foregetPasswordPressed(_ sender: UIButton) {
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        let controller = HomeViewController.instantiate()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func createAccountPressed(_ sender: UIButton) {
    }
}
