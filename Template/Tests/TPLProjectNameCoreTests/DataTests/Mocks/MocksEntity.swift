//
//  MocksEntity.swift
//  TPLProjectNameCoreTests
//
//  Created by TPLAuthor on 10/16/19.
//

import Foundation
import RealmSwift
import TPLProjectNameCore

final class MocksEntity: BaseObject {
    @objc dynamic var title: String? = ""
    
    public convenience init(id: String, title: String) {
        self.init()
        self.id = id
        self.title = title
    }
}
