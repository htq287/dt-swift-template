//
//  HTTPServiceTests.swift
//  TPLProjectNameCoreTests
//
//  Created by TPLAuthor on 10/12/19.
//

import XCTest
import Foundation
import TPLProjectNameCore
import Alamofire

final class HTTPServiceTests: BaseTestCase {
    
    var agent: IHTTPManager?
    var apiRoot: String!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.agent = networkingFactory.alamofireManager()
        
        let infoDict: [String: Any]? = self.testBundle.infoDictionary
        self.apiRoot = infoDict?["API_ROOT"] as? String
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    override func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    override func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRequestResponse() {
        // Given
        let url = URL.init(string: "https://httpbin.org/get")
        let expectation = self.expectation(description: "GET request should succeed: \(url!.absoluteString)")
        var _response: HTTPURLResponse?
        
        // When
        self.agent?.request(url!, "GET", parameters: ["foo": "bar"], headers: nil, { (response: HTTPURLResponse?, error: Error?) in
            _response = response
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        // Then
        XCTAssertNotNil(_response)
    }
    
    func testSignIn() {
        var _response: HTTPURLResponse?
        
        // Given
        let urlString = self.apiRoot.appending("/api/login")
        let expectation = self.expectation(description: "POST SignIn should succeed: \(urlString)")
        let additionalHTTPHeaders: [String: String] = ["Content-Type": "application/json"]
        let parameters = ["username": "abc",
                          "email": "acb@gmail.com",
                          "password": "abc@123!"]
        
        // When
        self.agent?.request(URL.init(string: urlString)!, "POST", parameters: parameters, headers: additionalHTTPHeaders, { (response: HTTPURLResponse?, error: Error?) in
            _response = response
            expectation.fulfill()
        })
        
        // Then
        XCTAssertNotNil(_response)
    }
}
