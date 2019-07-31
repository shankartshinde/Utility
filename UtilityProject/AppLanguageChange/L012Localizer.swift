//
//  L012Localizer.swift
//  Localization102
//
//  Created by Shankar Shinde on 08/10/18.
//  Copyright © 2018 Shankar Shinde. All rights reserved.
//

import UIKit

class L012Localizer: NSObject {
    static func DoTheSwizzling() {
        // 1
        //MethodSwizzleGivenClassName(cls: Bundle.self, originalSelector: Selector("localizedStringForKey:value:table:"), overrideSelector: Selector("specialLocalizedStringForKey:value:table:"))
        MethodSwizzleGivenClassName(cls: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector: #selector(Bundle.specialLocalizedStringForKey(key:value:table:)))
//        MethodSwizzleGivenClassName(cls:UIApplication.self, originalSelector: #selector(getter: UIApplication.userInterfaceLayoutDirection), overrideSelector: #selector(getter: UIApplication.cstm_userInterfaceLayoutDirection))
    }
}
extension Bundle {
    @objc func specialLocalizedStringForKey(key: String, value: String?, table tableName: String?) -> String {

        let currentLanguage = L102Language.currentAppleLanguage()
        var bundle = Bundle();
        if let _path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") {
            bundle = Bundle(path: _path)!
        } else {
            let _path = Bundle.main.path(forResource:"Base", ofType: "lproj")!
            bundle = Bundle(path: _path)!
        }
        return bundle.specialLocalizedStringForKey(key:key, value:value, table:tableName)
    }
}

//extension UIApplication {
//    @objc var cstm_userInterfaceLayoutDirection : UIUserInterfaceLayoutDirection {
//        get {
//            var direction = UIUserInterfaceLayoutDirection.leftToRight
//            if L102Language.currentAppleLanguage() == "ar" {
//                direction = .rightToLeft
//            }
//            return direction
//        }
//    }
//}

/// Exchange the implementation of two methods for the same Class
func MethodSwizzleGivenClassName(cls: AnyClass, originalSelector: Selector, overrideSelector: Selector) {
    let origMethod: Method = class_getInstanceMethod(cls, originalSelector)!;
    let overrideMethod: Method = class_getInstanceMethod(cls, overrideSelector)!;
    if (class_addMethod(cls, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
        class_replaceMethod(cls, overrideSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, overrideMethod);
    }
}
