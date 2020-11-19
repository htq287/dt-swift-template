//
//  BaseTestCase.swift
//  TPLProjectNameCoreTests
//
//  Created by TPLAuthor on 10/15/19.
//

import XCTest
import Foundation
import TPLProjectNameCore

class BaseTestCase: XCTestCase {
    
    let timeout: TimeInterval = 5
    var networkingFactory: INetworkingFactory!
    var db: Database!
    
    var testBundle: Bundle!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.testBundle = Bundle(for: type(of: self))
        XCTAssertNotNil(testBundle)
        
        self.networkingFactory = NetworkingFactory()
        self.db = Database.init(databasePath: "")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func assert(on queue: DispatchQueue, assertions: @escaping () -> Void) {
        
        // will be displayed in the test log to help diagnose failures.
        let expect = expectation(description: "all assertions are complete")
        
        queue.async {
            assertions()
            expect.fulfill()
        }
        
        waitForExpectations(timeout: timeout)
    }

}
