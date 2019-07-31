//
//  UITextFieldPadding.swift
//  NitorShopping
//
//  Created by shankars on 10/23/18.
//  Copyright © 2018 Shankar Shinde. All rights reserved.
//

import Foundation
import UIKit
//https://medium.com/@sunnyleeyun/swift-4-add-padding-extension-to-uitextfield-uitextview-42ed550ab821
class UITextFieldPadding : UITextField {
    
    let padding = UIEdgeInsetsMake(0, 10, 0, 10)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,
                                     padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,
                                     padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,
                                     padding)
    }
    
}

class UITextViewPadding : UITextView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        textContainerInset = UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
    }
}
