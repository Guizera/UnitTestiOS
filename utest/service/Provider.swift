//
//  Provider.swift
//  utest
//
//  Created by José Alves da Cunha on 25/02/21.
//

import UIKit

enum jokeError: Error {
    case noData
    case invalidResponse
}

protocol ProviderProtocol {
    func getData(_ completion: @escaping([String]?, jokeError?) -> ())
}
class Provider: ProviderProtocol {
    
    func getData(_ completion: @escaping ([String]?, jokeError?) -> ()) {
        let url = String(format: "https://api.chucknorris.io/jokes/categories")
        guard let serviceUrl = URL(string: url) else { return }
        
        let request = URLRequest(url: serviceUrl)
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if(error != nil) {
                completion(nil, .noData)
            }
            if let data = data {
                do {
                    let jokes = try JSONDecoder().decode([String].self, from: data)
                    completion(jokes, nil)
                } catch {
                    completion(nil, .noData)
                }
            }
        }.resume()
    }
    
    
}
