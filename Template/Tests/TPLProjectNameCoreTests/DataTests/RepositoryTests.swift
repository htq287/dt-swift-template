//
//  RepositoryTests.swift
//  TPLProjectNameCoreTests
//
//  Created by TPLAuthor on 10/12/19.
//

import XCTest
import Foundation
import TPLProjectNameCore

class RepositoryTests: BaseTestCase {
    
    var mocksRepository: MocksEntityRepository!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.mocksRepository = MocksEntityRepository()
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
    
    func testCreate() {
        let entity = MocksEntity.init(id: UUID().uuidString, title: "Swift RepositoryTests")
        self.mocksRepository.create(entity)
        self.mocksRepository.delete(entity)
    }

}
