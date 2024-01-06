//
//  UIView+Extentions.swift
//  Resturant
//
//  Created by amro adil on 07/12/2023.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius : CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth : CGFloat {
        get { return self.borderWidth }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        get { return self.borderColor }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    
//    @IBInspectable var borderWidthV: CGFloat {
//            get {
//                return layer.borderWidth
//            }
//            set {
//                layer.borderWidth = newValue
//            }
//        }
//        
//        @IBInspectable var borderColorV: UIColor? {
//            get {
//                return UIColor(cgColor: layer.borderColor!)
//            }
//            set {
//                layer.borderColor = newValue?.cgColor
//            }
//        }
    
}

//class FormTextField: UITextField {
//
//    @IBInspectable var borderColor: UIColor? {
//        didSet {
//            layer.borderColor = borderColor?.cgColor
//        }
//    }
//
//    @IBInspectable override var borderWidth: CGFloat  {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//    
//    @IBInspectable override var borderColor: CGFloat  {
//        didSet {
//            layer.borderColor = borderColor
//        }
//    }
//}
