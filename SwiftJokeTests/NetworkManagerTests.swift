//
//  NetworkManagerTests.swift
//  NetworkManagerTests
//
//  Created by Matt M Smith on 1/24/21.
//

import XCTest

class NetworkManagerTests: XCTestCase {

    func testBuildFunctionDoesNotThrowAnError() {
        XCTAssertNoThrow(try NetworkManager.build { "test" })
    }
    
    func testBuildFunctionDoesThrowAnError() {
        XCTAssertThrowsError(try NetworkManager.build {" "})
    }
    
    func testBuildFunctionAcceptsStringWithSpacesInQuery() {
        let query = "test ing"
        let testURL = try! NetworkManager.build {
            let formattedTestString = query.replacingOccurrences(of: " ", with: "+")
            return formattedTestString
        }
        
        XCTAssert(testURL.description == "test+ing")
    }
}
