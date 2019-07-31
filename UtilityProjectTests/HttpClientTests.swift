//
//  HttpClientTests.swift
//  UtilityProjectTests
//
//  Created by shankars on 1/15/19.
//  Copyright © 2019 shankars. All rights reserved.
//

import XCTest

class HttpClientTests: XCTestCase {
    //The variable, httpClient, is the system under test (SUT)
    var httpClient : HttpClient!
    //we inject the mock session to httpClient. It makes the httpClient run over MockURLSession instead of URLSession.shared.
    let session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //The interface of MockURLSession is different from that of URLSession. Thus, the compiler won’t recognize MockURLSession when we try to inject it. We have to make the mock object’s interface be the same as a real object. So, let’s introduce the “Protocol”!
        httpClient = HttpClient(session: session)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_get_RequestWithURL() {
        let getUrlStr = "http://httpbin.org/get"
        let url = URL(string: getUrlStr)
        guard let validURL = url else {
            fatalError("URL can't be empty")
        }
        
        httpClient.get(url: validURL) { (data, error) in
            
        }
        
        XCTAssert(session.lastURL == url)
        
    }
    
    func test_get_resume_called() {
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        guard let url = URL(string: "https://mockurl") else {
            fatalError("URL can't be empty")
        }
        httpClient.get(url: url) { (success, response) in
            // Return data
        }
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func test_get_should_return_data() {
        let expectedData = "{}".data(using: .utf8)
        
        session.nextData = expectedData
        
        var actualData: Data?
        httpClient.get(url: URL(string: "http://mockurl")!) { (data, error) in
            actualData = data
        }
        
        XCTAssertNotNil(actualData)
    }
}
