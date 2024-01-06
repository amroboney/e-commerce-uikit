//
//  NetworkManeger.swift
//  Resturant
//
//  Created by amro adil on 11/12/2023.
//

import Foundation
import UIKit

struct NetworkManeger{
    
    static let shared = NetworkManeger()
    
    private init(){}
    
    func fetchLogin(data: Int, completion: @escaping  (Result<Login, Error>) -> Void) {
        let parms = [
            "phone": data
        ]
        request(route: .login, method: .post,parameters: parms , completion: completion)
    }
    
    func fetchLoginVerify(data: [String: Any], completion: @escaping  (Result<Login, Error>) -> Void) {
        request(route: .verify, method: .post,parameters: data , completion: completion)
    }
    
    func fetchAllCategories(completion: @escaping (Result<[Category],Error>)-> Void) {
        request(route: .categories, method: .get, completion: completion)
    }
    
    func fetchPopulars(completion: @escaping (Result<[Product],Error>)-> Void) {
        request(route: .newProduct, method: .get, completion: completion)
    }
    
    func fetchProductsByCateoryId(categoryId: String,completion: @escaping(Result<[Product],Error>)-> Void) {
        request(route: .productByCatrgory(categoryId), method: .get, completion: completion)
    }
    
    func fetchFindProduct(productId: String, completion: @escaping(Result<Product, Error>) -> Void) {
        request(route: .findProduct(productId), method: .get, completion: completion)
    }
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - route: the base url for the back-end
    ///   - method: the type of method fot request
    ///   - parameter: the data send on the request
    ///   - type: <#type description#>
    ///   - completion: <#completion description#>
    /// - Returns: <#description#>
    private func request<T: Decodable>(route: Route, method: Method, parameters: [String: Any]? = nil, completion:@escaping (Result<T, Error>) -> Void) {
        
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknowError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            var result: Result<Data, Error>?
            
//            if let httpResponse = response as? HTTPURLResponse {
//                
//                let statusCode = httpResponse.statusCode
//                print(statusCode)
//                if (200..<300).contains(statusCode) {
//                   
//                    if let data = data {
//                        result = .success(data)
//                        let responseString = String(data: data, encoding: .utf8) ?? "could not stringify our data"
//                        DispatchQueue.main.async {
//                            self.handleResponse(result: result, completion: completion)
//                        }
//                    }else if let error = error {
//                        result = .failure(error)
//                        print("the error is \(error)")
//                    }
//                    
//                }else if  statusCode == 422 {
//                    
//                    
//                    if let data = data {
//                        result = .success(data)
//                        let responseString = String(data: data, encoding: .utf8) ?? "could not stringify our data"
//                        DispatchQueue.main.async {
//                            self.handleErrorValidation(result: result, completion: completion)
//                        }
//                    }
//                }
//            }
            
            
           
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "could not stringify our data"
                print("boney1")
                print(responseString)
            }else if let error = error {
                result = .failure(error)
                print("the error is \(error)")
            }
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
        
    }
        
    private func handleResponse<T: Decodable>(result: Result<Data,Error>?, completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknowError))
            return
        }
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            
            
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            
            if let error = response.errors {
                completion(.failure(AppError.serverError(error as! String)))
                return
            }
            
            if let decodedData = response.data {
                completion(.success(decodedData))
            }else {
                print(response.data)
                print("boney")
                completion(.failure(AppError.unknowError))
            }
                    
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    
    
    private func handleErrorValidation<T: Decodable>(result: Result<Data,Error>?, completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknowError))
            return
        }
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            
            
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            
            if let error = response.errors {
                completion(.failure(AppError.serverError(error as! String)))
                return
            }
            
            if let decodedData = response.data {
                completion(.success(decodedData))
            }else {
                print(response.data)
                print("boney")
                completion(.failure(AppError.unknowError))
            }
                    
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    
    /// this function to generate URl Request
    /// - Parameters:
    ///   - route: the base route for request for the back end
    ///   - method: the type of method for the request
    ///   - parameters: the parameter want to send with the request
    /// - Returns: the URLRequest
    private func createRequest(route: Route, method: Method, parameters: [String: Any]? = nil) -> URLRequest?{
        // generate the base url for the request
        let urlString = Route.baseUrl + route.descripiton
        // check the url and convert to url request
        guard let url = urlString.asURL else { return nil }
        // create the urlrequest
        var urlRequest = URLRequest(url: url)
        // the the header
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // add the method
        urlRequest.httpMethod = method.rawValue
        // add the paramerters
        if let parms = parameters {
            switch method{
            case .get, .delete:
                // send the data on the base url
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = parms.map({ (key: String, value: Any) in
                    URLQueryItem(name: key, value: "\(value)")
                })
                urlRequest.url = urlComponent?.url
                
            case .post, .put, .patch:
                // send the data on body
                let bodyData = try? JSONSerialization.data(withJSONObject: parms, options: [])
                urlRequest.httpBody = bodyData
                        
            }
        }
        return urlRequest
    }
}
