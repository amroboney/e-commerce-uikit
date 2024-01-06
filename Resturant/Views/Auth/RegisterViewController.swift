//
//  RegisterViewController.swift
//  Resturant
//
//  Created by amro adil on 13/12/2023.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneKeyTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Create Account"
    }
    

    @IBAction func showPasswordPressed(_ sender: Any) {
        passwordTF.isSecureTextEntry.toggle()
        
    }
    @IBAction func createAccountPressed(_ sender: UIButton) {
    }
    @IBAction func loginPagePresse(_ sender: UIButton) {
    }
}
