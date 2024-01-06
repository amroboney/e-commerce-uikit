//
//  AllDishes.swift
//  Resturant
//
//  Created by amro adil on 11/12/2023.
//

import Foundation

struct AllDishes: Decodable{
    let categories: [Category]?
    let populars: [Product]?
    let speicals: [Product]?
}
