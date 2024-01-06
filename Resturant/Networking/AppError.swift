//
//  AppError.swift
//  Resturant
//
//  Created by amro adil on 11/12/2023.
//

import Foundation

enum AppError: LocalizedError{
    case errorDecoding
    case unknowError
    case invalideError
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknowError:
            return "unkown what is happened"
        case .invalideError:
            return "The URL is invalid"
        case .serverError(let string):
            return string
        }
    }
}
