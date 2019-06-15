//
//  File.swift
//  
//
//  Created by Mark Struzinski on 6/13/19.
//

import Foundation

extension EndPoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "itunes.apple.com"
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}
