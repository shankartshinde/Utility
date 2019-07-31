//
//  MockURLSession.swift
//  UtilityProjectTests
//
//  Created by shankars on 1/15/19.
//  Copyright © 2019 shankars. All rights reserved.
//

import XCTest
import UIKit

class MockURLSession:URLSessionProtocol {
    
    var lastURL : URL?
    
    var nextDataTask = MockURLSessionDataTask()
    var nextData: Data?
    var nextError: Error?
    
/*
    func dataTask(with request: NSURLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask {
        lastURL = request.url
        completionHandler(nextData, successHttpURLResponse(request: request), nextError)
        return // dataTask, will be impletmented later
    }
 */

    func successHttpURLResponse(request: URLRequest) -> URLResponse {
        return HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
    }
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        lastURL = request.url
        completionHandler(nextData, successHttpURLResponse(request: request), nextError)
        return nextDataTask
    }
}

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    var resumeWasCalled = false
    func resume() {
        resumeWasCalled = true
    }
}
