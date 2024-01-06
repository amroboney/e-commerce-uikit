//
//  DishCategory.swift
//  Resturant
//
//  Created by amro adil on 09/12/2023.
//

import Foundation


struct Category: Decodable {
    let id, name, image, parent_id, status, parentname : String?
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case image = "categories_image"
        case parent_id
        case status
        case parentname
    }
    
}


struct ResponseData: Decodable {
    let status: String?
    let message: String?
    let data: [Category]?
}
