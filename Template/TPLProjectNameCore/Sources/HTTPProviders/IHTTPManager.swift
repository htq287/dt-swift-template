//
//  IHTTPManager.swift
//  TPLProjectNameCore
//
//  Created by TPLAuthor on 10/12/19.
//

import Foundation

public protocol IHTTPManager {
    func request(_ url: URL, _ method: String, parameters: [String: Any]?, headers: [String: String]?, _ completionHandler: @escaping ((_ response: HTTPURLResponse?, _ error: Error?) -> Void))
    
}
