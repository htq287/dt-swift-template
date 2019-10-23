//
//  MocksEntityRepository.swift
//  TPLProjectNameCoreTests
//
//  Created by TPLAuthor on 10/16/19.
//

import Foundation
import TPLProjectNameCore

final class MocksEntityRepository: IBaseRepository {
    typealias T = MocksEntity
    
    fileprivate let gr = GenericItemRepository.si

    // MARK: IBaseRepository implementations
    func create(_ object: MocksEntity) {
        gr.create(object)
    }
    
    func update(_ object: MocksEntity) {
        gr.update(object)
    }
    
    func delete(_ object: MocksEntity) {
        gr.delete(object)
    }
}
