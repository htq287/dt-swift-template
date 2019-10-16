//
//  IBaseRepository.swift
//  TPLProjectNameCore
//
//  Created by TPLAuthor on 10/12/19.
//

import Foundation

public protocol IRead {
    
    associatedtype T
    
    func create(_ object: T) -> Void
    func update(_ object: T) -> Void
    func delete(_ object: T) -> Void
}

public protocol IWrite {
    
}

public protocol IBaseRepository: IRead, IWrite {
    
    associatedtype T
}
