//
//  AlertService.swift
//  Resturant
//
//  Created by amro adil on 28/12/2023.
//

import UIKit

class AlertService {
    
    func alert(message:String) ->UIAlertController {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        
        return alert
    }
}
