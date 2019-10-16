//
//  GenericItemRepository.swift
//  TPLProjectNameCore
//
//  Created by TPLAuthor on 10/12/19.
//

import Foundation

open class GenericItemRepository: IBaseRepository {

    public static var si = GenericItemRepository()
    
    public typealias T = BaseObject
    
    let db: Database
    
    init() {
        self.db = Database(databasePath: "")
    }
    
    
    // MARK: - IBaseRepository Implementations
    public func create(_ object: BaseObject) {
        db.create(object)
    }
    
    public func update(_ object: BaseObject) {
        db.update(object)
    }
    
    public func delete(_ object: BaseObject) {
        db.delete(object)
    }
}
