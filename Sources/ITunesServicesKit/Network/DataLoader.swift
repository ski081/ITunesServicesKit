//
//  File.swift
//  
//
//  Created by Mark Struzinski on 6/13/19.
//

import Foundation

class DataLoader {
    let urlSession: URLSession
    var dataTask: URLSessionDataTask?
    
    init(urlSession: URLSession = URLSession(configuration: .default)) {
        self.urlSession = urlSession
    }
    
    func request(_ endpoint: EndPoint,
                 completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = endpoint.url else {
            return completion(.failure(.invalidURL))
        }
        
        dataTask = urlSession.dataTask(with: url) { (data, response, error) in
            defer {
                self.dataTask = nil
            }
            
            if let error = error {
                let networkError = NetworkError.urlRequestFailed(message: error.localizedDescription)
                return completion(.failure(networkError))
            }
            
            guard let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                return completion(.failure(.invalidResponse))
            }
            
            completion(.success(data))
        }
        
        dataTask?.resume()
    }
}
