//
//  String_EmailValidation.swift
//  UtilityProject
//
//  Created by shankars on 1/29/19.
//  Copyright © 2019 shankars. All rights reserved.
//

import Foundation

extension String {
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.characters.count && self.characters.count == 11
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
            "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    // Calucate Age passing Date
    func calculateAgeDifference(dateString : String) -> String? {
        let date3 = DateComponents(calendar: .current, year: 2014, month: 11, day: 28, hour: 5, minute: 9).date!
        let date4 = DateComponents(calendar: .current, year: 2015, month: 11, day: 28, hour: 5, minute: 9).date!
        
        let timeOffset2 = date4.offset(from: date3)
        print(timeOffset2)
        
        
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.year,.month,.weekOfMonth,.day,.hour,.minute,.second]
        // Cannot add in .nanosecond here (⬆︎) as Swift 4.1 does not consider nanoseconds a calendrical unit
        
        dateComponentsFormatter.maximumUnitCount = 1
        dateComponentsFormatter.unitsStyle = .full
        
        let dateOfBirth =  dateString
        let date = dateOfBirth.toDate(withFormat: "dd/MM/YYYY")
        let difference =  dateComponentsFormatter.string(from: date , to: Date())  // "1 month"
        return difference
    }
}
