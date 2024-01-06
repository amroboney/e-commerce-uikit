//
//  Product.swift
//  Resturant
//
//  Created by amro adil on 10/12/2023.
//

import Foundation


struct Product: Decodable {
    let id: String
    let name: String
    let image: String?
    let calarois: Int?
    let size: String
    let attr_unit_id: String
    let quantity: String?
    let liked : String?
    let price: String
    let description: String?

    var formatPrice: String {
        return "\(price) $"
    }
    
    var formatSize: String {
        return "\(size) \(attr_unit_id)"
    }
    
    
    
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case image = "display_url"
        case price
        case quantity
        case size
        case attr_unit_id
        case liked
        case calarois
        case description
    }
}

//struct DataResponse:Decodable {
//    let current_page: Int
//    let data: [Dash]
//    let first_page_url: String?
//    let from: Int?
//    let last_page: Int?
//    let last_page_url: String?
//    let links: [String]
//    let next_page_url: String?
//    let path: String?
//    let per_page: Int?
//    let prev_page_url: String?
//    let to: Int?
//    let total: Int?
//}
