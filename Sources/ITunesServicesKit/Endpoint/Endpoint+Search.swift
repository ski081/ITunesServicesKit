//
//  File.swift
//  
//
//  Created by Mark Struzinski on 6/13/19.
//

import Foundation

extension EndPoint {
    static func search(for term: String) -> EndPoint {
        let queryItems = [
            URLQueryItem(name: "term", value: term),
            URLQueryItem(name: "media", value: "software"),
            URLQueryItem(name: "country", value: "US")
        ]
        
        return EndPoint(path: "/us/search",
                        queryItems: queryItems)
    }
}
