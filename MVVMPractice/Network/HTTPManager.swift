//
//  HTTPManager.swift
//  MVVMPractice
//
//  Created by Ashish Chatterjee on 9/20/20.
//  Copyright © 2020 Ashish Chatterjee. All rights reserved.
//

import UIKit

class HTTPManager: Identifiable {
    static let shared: HTTPManager = HTTPManager()
    
    enum HTTPError: Error {
        case invalidURL
        case invalidResponse(Data?, URLResponse?)
    }
    
    public func get(urlString: String, completionBlock: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completionBlock(.failure(HTTPError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completionBlock(.failure(error!))
                return
            }

            guard
                let responseData = data,
                let httpResponse = response as? HTTPURLResponse,
                200 ..< 300 ~= httpResponse.statusCode else {
                    completionBlock(.failure(HTTPError.invalidResponse(data, response)))
                    return
            }

            completionBlock(.success(responseData))
        }
        task.resume()
    }
    
    public func downloadImage(urlString: String, completionBlock: @escaping (UIImage?,Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionBlock(nil,HTTPError.invalidURL)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completionBlock(nil,error)
                return
            }
            
            guard   let responseData = data,
                    let httpResponse = response as? HTTPURLResponse,
                    200 ..< 300 ~= httpResponse.statusCode else {
                        completionBlock(nil,HTTPError.invalidResponse(data, response))
                        return
            }
            
            if let image = UIImage(data: responseData) {
                completionBlock(image,nil)
                return
            }
        }
        task.resume()
    }
    
}
