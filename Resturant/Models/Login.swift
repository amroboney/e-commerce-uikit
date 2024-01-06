//
//  Login.swift
//  Resturant
//
//  Created by amro adil on 14/12/2023.
//

import Foundation

struct Login:Decodable {
    let id: Int?
    let phone: String
    let otp: Int?
    let created_at: String?
}
