//
//  ViewController.swift
//  UtilityProject
//
//  Created by shankars on 1/14/19.
//  Copyright © 2019 shankars. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let  getUrlStr = "http://httpbin.org/get"
    let oddNumber = [1,3,5,7,9]

    
    // swiftlint:disable:next force_cast
    let noWarning = NSNumber() as! Int
    let hasWarning = NSNumber() as! Int
    let noWarning2 = NSNumber() as! Int // swiftlint:disable:this force_cast
    let noWarning3 = NSNumber() as! Int
    // swiftlint:disable:previous force_cast

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadService()
        loadHTTPClientService()

        let thirdPostion = oddNumber.index(of: 2)
        print(thirdPostion!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}


extension ViewController {
    func loadHTTPClientService() {
        //HttpClient().get(url: , callback: <#T##HttpClient.completeClosure##HttpClient.completeClosure##(Data?, Error?) -> Void#>)
        let temporaryURL = URL(string: getUrlStr)!
        let session = URLSession(configuration: .default)
        HttpClient.init(session:session).get(url: temporaryURL) { (data, error) in
            if error != nil {
                return
            }
        }
    }
}

// MARK: - Traditional service calling in the view controller
extension ViewController {
    func loadService() {
        // https://stackoverflow.com/questions/48285694/swift-json-login-rest-with-post-and-get-response-example
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let dataTask = session.dataTask(with: URL(string:getUrlStr)!) { (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        print("error trying to convert data to JSON")
                        return
                }
                // now we have the todo
                // let's just print it to prove we can access it
                print("The todo is: " + todo.description)
                
                // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
                guard let todoTitle = todo["origin"] as? String else {
                    print("Could not get todo title from JSON")
                    return
                }
                print("The title is: " + todoTitle)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        
        dataTask.resume()
    }
}

