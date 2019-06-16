import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(URLBuilderTests.allTests),
        testCase(SearchResultTests.allTests),
        testCase(ITunesNetworkClientTests.allTests)
    ]
}
#endif
