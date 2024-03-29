//
//  File.swift
//  
//
//  Created by Mark Struzinski on 6/14/19.
//

import Foundation
import SwiftUI

public struct SearchResult: Decodable {
    public let id: Int
    public let trackName: String?
    public let artistName: String?
    private let artworkURL100: URL?
}

extension SearchResult {
    private enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case trackName
        case artistName
        case artworkURL100 = "artworkUrl100"
    }
}

extension SearchResult {
    func artworkURL(size dimension: Int = 100) -> URL? {
        guard dimension > 0, dimension != 100,
            var url = artworkURL100 else {
            return artworkURL100
        }
        
        url.deleteLastPathComponent()
        url.appendPathComponent("\(dimension)x\(dimension)bb.jpg")
        
        return url
    }
}

extension SearchResult: Identifiable {}
