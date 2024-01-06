//
//  ApiResponse.swift
//  Resturant
//
//  Created by amro adil on 11/12/2023.
//

import Foundation

struct ApiResponse <T: Decodable> : Decodable {
    let status: String?
    let message: String?
    let data: T?
    let errors: T?
}



