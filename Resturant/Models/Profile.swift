//
//  Profile.swift
//  Resturant
//
//  Created by amro adil on 26/12/2023.
//

import Foundation

struct Profile: Decodable {
    let name: String?
    let phone: String
    let email: String?
    let image: String?
    let created_at: String?
}
