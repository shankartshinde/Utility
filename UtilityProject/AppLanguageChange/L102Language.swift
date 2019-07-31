//
//  L102Language.swift
//  Localization102
//
//  Created by Shankar Shinde on 08/10/18.
//  Copyright © 2018 Shankar Shinde. All rights reserved.
//

import Foundation

let APPLE_LANGUAGE_KEY = "AppleLanguages"
/// L102Language
class L102Language {
    /// get current Apple language
    class func currentAppleLanguage() -> String{
        let userdef = UserDefaults.standard // NSUserDefaults.standardUserDefaults()
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! Array<Any> //userdef.objectForKey(APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.first as! String
        return current
    }
    /// set @lang to be the first in Applelanguages list
    class func setAppleLAnguageTo(lang: String) {
        let userdef = UserDefaults.standard //let userdef = NSUserDefaults.standardUserDefaults()
        userdef.set([lang,currentAppleLanguage()], forKey: APPLE_LANGUAGE_KEY)
        //userdef.setObject([lang,currentAppleLanguage()], forKey: APPLE_LANGUAGE_KEY)
        userdef.synchronize()
    }
}
