//
//  LoginPhoneViewController.swift
//  Resturant
//
//  Created by amro adil on 13/12/2023.
//

import UIKit
import ProgressHUD


class LoginPhoneViewController: UIViewController {

    var countryCodes = [[String]]()
    
    @IBOutlet weak var keyPhoneTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var phoneError: UILabel!
    @IBOutlet weak var lopinBtnPressed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTF.text = "999080082"
        self.countryCodes = getAllCountryCodes()
        picker()
        resetForm()
        
        
    }
    
  
    @IBAction func loginPressed(_ sender: LoaderButton) {
        let phone = Int("\(keyPhoneTF.text!)\(phoneTF.text!)")
        sender.isLoading = true
        
        NetworkManeger.shared.fetchLogin(data: phone!) {[weak self] (result) in
            sender.isLoading = false
            switch result {
            case .success(_):
                let controller = VerifyViewController.instantiate()
                controller.phone = phone
                self?.navigationController?.pushViewController(controller, animated: true)
            case .failure(let error):
                print("error in fetsh login controller")
                print(error.localizedDescription)
            }
            
        }
    }
    
    @IBAction func loginPresseds(_ sender: UIButton) {
        
        
        
    }
    
    
    
    // MARK: - Validation phone number

    @IBAction func phoneOnEdit(_ sender: UITextField) {
        if let phoneNumber = phoneTF.text {
            if let errorMessage = invalidPhoneNumber(phoneNumber) {
                phoneError.text = errorMessage
                phoneError.isHidden = false
            }else{
                phoneError.isHidden = true
            }
            checkForValidForm()
        }
    }
    
    func checkForValidForm() {
        if phoneError.isHidden {
            return lopinBtnPressed.isEnabled = true
        }else{
            return lopinBtnPressed.isEnabled = false
        }
    }
    
    func invalidPhoneNumber(_ value: String) -> String? {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set){
            return "Phone nubmer must contain only number"
        }
        if value.count != 9 {
            return "Phone number must be 10 digits on length"
        }
        return nil
        
    }
    
    func resetForm() {
        lopinBtnPressed.isEnabled = false
        phoneError.isHidden = false
        phoneError.text = "Required"
        phoneTF.text = ""
    }
    
    
    // MARK: - key country picker
    func getAllCountryCodes() -> [[String]]{
        var countries = [[String]]()
        let countryList = GlobalConstrants.Constrants.codePrfix
        for item in countryList {
            countries.append(item.value)
        }
        
        let stored = countries.sorted(by: { $0[0] < $1[0] })
        return stored
    }
    
    func picker() {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        keyPhoneTF.inputView = picker
        picker.selectRow(0, inComponent: 0, animated: true)
        
        
    }
    
}

// MARK: - lgoinPhone extensions

extension LoginPhoneViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryCodes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let code = countryCodes[row]
        return "\(code[0]) + \(code[1]) "
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let code = countryCodes[row]
        keyPhoneTF.text = "+\(code[1])"
    }
}
