//
//  UIViewExtension.swift
//  NitorShopping
//
//  Created by shankars on 10/23/18.
//  Copyright © 2018 Shankar Shinde. All rights reserved.
//

import Foundation
import UIKit
/*https://medium.com/@sunnyleeyun/swift-4-extension-for-inspectable-corner-radius-border-color-and-shadow-1fc2eae2622b*/

@IBDesignable
class DesignableTextField: UITextFieldPadding {
}

@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}


extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}


@IBDesignable class AttributedNavigationBar: UINavigationBar {
    
    @IBInspectable var imageTitle: UIImage? = nil {
        
        didSet {
            
            guard let imageTitle = imageTitle else {
                
                topItem?.titleView = nil
                
                return
            }
            
            let imageView = UIImageView(image: imageTitle)
            imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 30)
            imageView.contentMode = .scaleAspectFit
            
            topItem?.titleView = imageView
        }
    }
}
