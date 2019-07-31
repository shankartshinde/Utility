//
//  HttpClient.swift
//  UtilityProject
//
//  Created by shankars on 1/14/19.
//  Copyright © 2019 shankars. All rights reserved.
//

// NOTE :: UNIT testing of network layer
//https://medium.com/flawless-app-stories/the-complete-guide-to-network-unit-testing-in-swift-db8b3ee2c327

import Foundation
import UIKit
/* Stage - 1
class HttpClient {
    typealias completeClosure = ( _ data: Data?, _ error: Error?)->Void
    func get( url: URL, callback: @escaping completeClosure ) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //let session = URLSession(configuration: URLSessionConfiguration.default)
        
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            callback(data, error)
//        }
//        task.resume()
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            callback(data, error)
        }
        task.resume()
    }
}
*/

/*
  Stage - 2
class HttpClient {
    typealias completeClosure = ( _ data: Data?, _ error: Error?)->Void
    private let session : URLSession
    
    init(session:URLSessionProtocol) {
        self.session = session
    }
    
    func get( url: URL, callback: @escaping completeClosure ) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            callback(data, error)
        }
        task.resume()
    }
}
 */

class HttpClient {
    typealias CompleteClosure = ( _ data: Data?, _ error: Error?) -> Void
    //The dependency of HttpClient is:
    //private let session : URLSession
    
    //We want the session to be either URLSession or MockURLSession. So we change the type from URLSession to a protocol, URLSessionProtocol:
    private let session: URLSessionProtocol
    
    init(session:URLSessionProtocol) {
        self.session = session
    }
    
    func get( url: URL, callback: @escaping CompleteClosure ) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            callback(data, error)
        }
        task.resume()
    }
}
