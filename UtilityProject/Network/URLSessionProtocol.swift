//
//  URLSessionProtocol.swift
//  UtilityProject
//
//  Created by shankars on 1/15/19.
//  Copyright © 2019 shankars. All rights reserved.
//

import Foundation
protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?,URLResponse?,Error?) -> Void
    func dataTask(with request:URLRequest,completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

protocol URLSessionDataTaskProtocol {
    func resume()
}

//We also have to make the real objects conform the protocols.


// The problem is, URLSession does not have a dataTask() returning URLSessionDataTaskProtocol. So we need to extend a method to conform the protocol.
extension URLSession: URLSessionProtocol {
    
    func dataTask(with request: URLRequest, completionHandler:@escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTaskProtocol {
        //return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTaskProtocol
        return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
    }
}

//The URLSessionDataTask has the exact same protocol method, resume(), so nothing happens about URLSessionDataTask.
extension URLSessionDataTask : URLSessionDataTaskProtocol {}

