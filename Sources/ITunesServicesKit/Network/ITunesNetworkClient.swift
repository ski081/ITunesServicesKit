//
//  File.swift
//  
//
//  Created by Mark Struzinski on 6/14/19.
//

import Foundation

/// Wrapper for all requests
public class ITunesNetworkClient {
    let dataLoader: DataLoader
    let urlSession: URLSession
    
    public init(urlSession: URLSession = URLSession(configuration: .default)) {
        self.urlSession = urlSession
        self.dataLoader = DataLoader(urlSession: urlSession)
    }
    
    /// Performs a search for software entries
    /// - Parameter searchTerm: search term
    /// - Parameter completion: block to fire on completion
    public func search(for searchTerm: String,
                       completion: @escaping (Result<SearchResponse, NetworkError>) -> Void) {
        let endpoint = EndPoint.search(for: searchTerm)
        dataLoader.request(endpoint) { result in
            switch result {
            case .failure(let error):
                return completion(.failure(error))
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                guard let searchResponse = try? jsonDecoder.decode(SearchResponse.self, from: data) else {
                    return completion(.failure(NetworkError.invalidResponse))
                }
                
                completion(.success(searchResponse))
            }
        }
    }
}
