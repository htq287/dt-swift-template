//
//  BaseObject.swift
//  TPLProjectNameCore
//
//  Created by TPLAuthor on 10/12/19.
//

import Foundation
import RealmSwift

open class BaseObject: Object {
    @objc dynamic public var id: String = ""
    
    override public static func primaryKey() -> String? {
        return "id"
    }
}
