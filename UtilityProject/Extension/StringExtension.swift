//
//  StringExtension.swift
//  UtilityProject
//
//  Created by shankars on 1/25/19.
//  Copyright © 2019 shankars. All rights reserved.
//

import Foundation
//extension String {
//    subscript(_ range: CountableRange<Int>) -> String {
//        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
//        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
//        return String(self[idx1..<idx2])
//    }
//}

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func substring(_ from: Int) -> String {
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: from))
    }
    
    var length: Int {
        return self.count
    }
    
}

/*
let s = "hello"
s[0..<3] // "hel"
s[3..<s.count] // "lo"

let s = "😎🤣😋"
s[0..<1] // "😎"
*/
extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[idx1..<idx2])
    }
}

