//
//  String+Extenstions.swift
//  Resturant
//
//  Created by amro adil on 09/12/2023.
//

import Foundation

extension String {
    
    var asURL: URL? {
        return URL(string: self)
    }
}
