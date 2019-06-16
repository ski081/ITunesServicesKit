//
//  File.swift
//  
//
//  Created by Mark Struzinski on 6/13/19.
//

import Foundation

/// Network related error
public enum NetworkError: Error {
    case invalidURL
    case urlRequestFailed(message: String)
    case invalidResponse
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .urlRequestFailed(let message):
            return message
        case .invalidResponse:
            return "Invalid response"
        }
    }
}
