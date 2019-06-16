//
//  File.swift
//  
//
//  Created by Mark Struzinski on 6/15/19.
//

import XCTest
@testable import ITunesServicesKit

final class ITunesNetworkClientTests: XCTestCase {
    var session: URLSession!
    
    override func setUp() {
        super.setUp()
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        
        session = URLSession(configuration: config)
    }
    
    func testSearchRequest() {
        let client = ITunesNetworkClient(urlSession: session)
        
        let iTunesExpectation = expectation(description: "Itunes Search Request")
        
        client.search(for: "test") { result in
            iTunesExpectation.fulfill()
            
            switch result {
            case .success(let response):
                XCTAssertEqual(response.results.count, 2, "2 results should be returned")
            case .failure:
                XCTFail("Search result should be returned")
            }
        }
        
        wait(for: [iTunesExpectation], timeout: 5.0)
    }
    
    static var allTests = [
        ("testSearchRequest", testSearchRequest)
    ]

}
