//
//  VerifyViewController.swift
//  Resturant
//
//  Created by amro adil on 13/12/2023.
//

import UIKit
import KeychainSwift

class VerifyViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var no1: UITextField!
    @IBOutlet weak var no2: UITextField!
    @IBOutlet weak var no3: UITextField!
    @IBOutlet weak var no4: UITextField!
    
    @IBOutlet weak var phoneLbl: UILabel!
    var phone: Int?
    let keychain = KeychainSwift()
    var dataToSend: [String: Any] = ["key": "value"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        convertToNextTextField()
        
        
        
        keychain.set("hello world", forKey: "my key")
        
        
    }
    
        
    

    @IBAction func verifyBtnPresseds(_ sender: UIButton) {
//        printContent("\(no1)\(no2)\(no3)\(no4)")
        let data = keychain.get("my key")
        print(data)
    }
    
    @IBAction func verifyBtnPressed(_ sender: LoaderButton) {
        let otp = "\(no1.text!)\(no2.text!)\(no3.text!)\(no4.text!)"
        
        
        
        let data = [
            "phone": "\(self.phone!)",
            "otp": Int(otp)
        ] as [String : Any]
        
        print(data)
        
        NetworkManeger.shared.fetchLoginVerify(data: data) {[weak self] (result) in
            sender.isLoading = false
            switch result {
            case .success(_):
                
                DispatchQueue.main.async(execute: {
                    let keychain = KeychainSwift()
                    keychain.set(result, forKey: "my key")
                })
                
                
                let controller = HomeViewController.instantiate()
                
                self?.navigationController?.pushViewController(controller, animated: true)
            case .failure(let error):
                print("error in fetsh login controller")
                print(error.localizedDescription)
            }
            
        }
    }
    
    // MARK: - convert to next taxt feild
    func convertToNextTextField() {
        self.no1.delegate = self
        self.no2.delegate = self
        self.no3.delegate = self
        self.no4.delegate = self
        
        no1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        no2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        no3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        no4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        
        no1.becomeFirstResponder()
        
        phoneLbl.text = "\(self.phone!)"
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        
        if text?.count == 1 {
            switch textField {
            case no1:
                no2.becomeFirstResponder()
            case no2:
                no3.becomeFirstResponder()
            case no3:
                no4.becomeFirstResponder()
            case no4:
                dismissKeyboard()
            default:
                break
            }
        }
        
        
        if text?.count == 0 {
            switch textField {
            case no1:
                no2.becomeFirstResponder()
            case no2:
                no3.becomeFirstResponder()
            case no3:
                no4.becomeFirstResponder()
            default:
                break
            }
        }
        else{
            
        }
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
