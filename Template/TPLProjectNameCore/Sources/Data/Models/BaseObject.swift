//
//  BaseObject.swift
//  TPLProjectNameCore
//
//  Created by TPLAuthor on 10/12/19.
//

import Foundation
import RealmSwift

class BaseObject: Object {
    @objc dynamic var id: String = ""
    
    override public static func primaryKey() -> String? {
        return "id"
    }
}
