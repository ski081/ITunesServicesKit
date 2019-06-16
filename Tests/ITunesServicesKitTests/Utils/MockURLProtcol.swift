//
//  File.swift
//  
//
//  Created by Mark Struzinski on 6/15/19.
//

import Foundation

class MockURLProtocol: URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let url = request.url else {
            fatalError("Invalid request")
        }
        
        let responseData = data(forURL: url)
        guard let response = HTTPURLResponse(url: url,
                                             statusCode: 200,
                                             httpVersion: nil,
                                             headerFields: nil) else {
                                                fatalError("Invalid response")
        }
        
        self.client?.urlProtocol(self,
                                 didLoad: responseData)
        self.client?.urlProtocol(self,
                                 didReceive: response,
                                 cacheStoragePolicy: .notAllowed)
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() { }

    func data(forURL url: URL) -> Data {
        guard let urlType = KnownURL(rawValue: url.absoluteString) else {
            fatalError("Invalid URL")
        }
        
        let testData = TestData()
        switch urlType {
        case .search:
            guard let data = testData.seaerchResults.data(using: .utf8) else {
                fatalError("Invalid data conversion")
            }
            
            return data
        }
    }
}

enum KnownURL: String {
    case search = "https://itunes.apple.com/us/search?term=test&media=software&country=US"
}


