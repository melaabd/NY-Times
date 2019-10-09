//
//  APIRequest.swift
//  NY-Times
//
//  Created by Alfoah IOS on 06/10/2019.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import Foundation

enum ArticalError : Error {
    case networkError
    case noDataAvilable
    case canNotProcessData
}

class APIRequest:NSObject {
    
    class func getArticals(completion: @escaping (Result<[Articale], ArticalError>)-> ()){
        
        guard let url = URL(string: URLs.newsURL) else{return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                completion(.failure(.networkError))
            } else {
                guard let jsonData = data else {
                 completion(.failure(.noDataAvilable))
                    return
                }
                do {
                    let articalsResult = try JSONDecoder().decode(ArticalsResult.self, from: data!)
                    let articals = articalsResult.results
                    completion(.success(articals!))
                } catch let jsonError {
                    completion(.failure(.canNotProcessData))
                }
                
            }
        }.resume()
    }
    

}

