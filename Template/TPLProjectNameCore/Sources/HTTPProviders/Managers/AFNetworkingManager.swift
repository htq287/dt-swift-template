//
//  AFNetworkingManager.swift
//  TPLProjectNameCore
//
//  Created by TPLAuthor on 10/14/19.
//

import Foundation

open class AFNetworkingManager: IHTTPManager {
    
    init() {
        print("Initialize \(self)")
    }
    
    // MARK: IHTTPService
    public func request(_ url: URL, _ method: String, parameters: [String : Any]?, headers: [String : String]?, _ completionHandler: @escaping ((HTTPURLResponse?, Error?) -> Void)) {
        print("\(self): on request")
    }
    
}
