//
//  File.swift
//  
//
//  Created by Mark Struzinski on 6/13/19.
//

import XCTest
@testable import ITunesServicesKit

final class URLBuilderTests: XCTestCase {
    func testSearchEndpoint() throws {
        let endpoint = EndPoint.search(for: "test")
        let result = try XCTUnwrap(endpoint.url, "Search URL should not be nil")
        XCTAssertEqual(result.absoluteString, "https://itunes.apple.com/us/search?term=test&media=software&country=US")
    }

    func testSearchEndpointIsEncoded() throws {
        let endpoint = EndPoint.search(for: "test this")
        let result = try XCTUnwrap(endpoint.url, "Search URL should not be nil")
        XCTAssertEqual(result.absoluteString, "https://itunes.apple.com/us/search?term=test%20this&media=software&country=US")
    }
    
    static var allTests = [
        ("testSearchEndpoint", testSearchEndpoint),
    ]
}

