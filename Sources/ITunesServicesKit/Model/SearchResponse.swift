//
//  File.swift
//  
//
//  Created by Mark Struzinski on 6/14/19.
//

import Foundation

public struct SearchResponse: Decodable {
    public let results: [SearchResult]
}
