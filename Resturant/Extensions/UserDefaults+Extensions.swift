//
//  UserDefaults+Extensions.swift
//  Resturant
//
//  Created by amro adil on 13/12/2023.
//

import Foundation

extension UserDefaults {
    
    private enum UserDefaultKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded : Bool {
        get {
            bool(forKey: UserDefaultKeys.hasOnboarded.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultKeys.hasOnboarded.rawValue)
        }
    }
}
