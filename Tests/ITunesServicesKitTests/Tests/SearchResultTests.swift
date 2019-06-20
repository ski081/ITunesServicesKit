//
//  File.swift
//  
//
//  Created by Mark Struzinski on 6/15/19.
//

import XCTest
@testable import ITunesServicesKit

final class SearchResultsTests: XCTestCase {
    let testData = TestData()
    func testValidSearchResultDecode() throws {
        let data = testData.searchResult.data(using: .utf8)!
        let decoder = JSONDecoder()
        
        let result = try XCTUnwrap(decoder.decode(SearchResult.self, from: data),
                                   "Search result should decode")
        XCTAssertEqual(result.artistName, "Lowe's Companies, Inc.", "Name should match")
        XCTAssertEqual(result.id, 457954781, "id should match")
    }

    func testValidSearchResponseDecode() throws {
        let data = testData.seaerchResults.data(using: .utf8)!
        let decoder = JSONDecoder()
        
        let result = try XCTUnwrap(decoder.decode(SearchResponse.self, from: data),
                                   "Search response should decode")
        XCTAssertEqual(result.results.count, 2, "There should be 2 results")
    }
    
    static var allTests = [
        ("testValidSearchResultDecode", testValidSearchResultDecode),
        ("testValidSearchResponseDecode", testValidSearchResponseDecode)
    ]
}
