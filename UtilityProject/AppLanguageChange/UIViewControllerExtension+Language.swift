//
//  UIViewControllerExtension.swift
//  UtilityProject
//
//  Created by shankars on 2/12/19.
//  Copyright © 2019 shankars. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    @objc @IBAction func switchLanguage(sender: UIButton) {
        if L102Language.currentAppleLanguage() == "en" {
            L102Language.setAppleLAnguageTo(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            L102Language.setAppleLAnguageTo(lang: "en")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        
        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        rootviewcontroller.rootViewController = mainStoryBoard.instantiateViewController(withIdentifier: "rootVC")
        if let mainwindow = UIApplication.shared.delegate?.window! {
            mainwindow.backgroundColor = UIColor(hue: 0.6477, saturation: 0.6314, brightness: 0.6077, alpha: 0.8)
            UIView.transition(with: self.view, duration: 0.55001, options: .transitionFlipFromLeft, animations: {
                
            }, completion: { (finished) in
                
            })
        }
        //customSetup() SWRevealViewController
        
        //        UIView.transition(with: self.view, duration: 0.55001, options: .transitionFlipFromLeft, animations: {
        //
        //        }, completion: { (finished) in
        //
        //        })
        
        
    }
}
