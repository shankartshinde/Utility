//
//  EmailValidityViewController.swift
//  UtilityProject
//
//  Created by shankars on 1/29/19.
//  Copyright © 2019 shankars. All rights reserved.
//

import UIKit

class EmailValidityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setNavigationBarItem()
        //multiplication()
        bigNumberMultipication()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

//    func multiplication() {
//        let aValue = 2.5
//        let bValue = 2
//        let final  = aValue * bValue
//        print(final)
//    }
    
    func bigNumberMultipication() {
        let numberString = "1552"
        let reverstedNumber = numberString.reversed()
        //let numberArray = reverstedNumber.map{Int($0)}
        var numberArrayString = [String]()
        for char in reverstedNumber {
            numberArrayString.append(String(char))
        }
        
        print(reverstedNumber)
        print(numberArrayString)
        print(String(reverstedNumber))
        var carry = 0
        var result = [Int]()
        for value in String(reverstedNumber) {
            var  multiplyValue = Int(String(value))!*3
            multiplyValue = carry + multiplyValue
            print(multiplyValue)
            if multiplyValue > 9 {
                carry = multiplyValue/10
                result.append(multiplyValue%10)
                
            } else {
                //multiplyValue = carry + multiplyValue
                if multiplyValue > 9 {
                    carry = multiplyValue/10
                    result.append(multiplyValue%10)
                } else {
                    result.append(multiplyValue)
                    carry = 0
                }
            }
        }
        if carry != 0 {
            result.append(carry)
            carry = 0
        }

        print(result)

    }
}

//func * (lhs: Double, rhs: Int) -> Double {
//    return lhs * Double(rhs)
//}
//
//func * (lhs:Int, rhs:Double) -> Double {
//    return Double(lhs) * rhs
//}


