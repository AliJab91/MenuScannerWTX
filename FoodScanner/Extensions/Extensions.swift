//
//  Extensions.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/20/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    
}

extension UIColor {
   static let viewColor = UIColor(red:0.00, green:0.00, blue:1.00, alpha:1.0)
      // return UIColor(red:0.00, green:0.00, blue:1.00, alpha:1.0)
    //}
}

extension UIButton {
    func createLoginButtons()  {
        self.backgroundColor = UIColor.viewColor
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1.2
        self.layer.masksToBounds = true
        self.tintColor = UIColor.black
    }
    
    func createUnderlindedButton(title:String!)  {
        let yourAttributes : [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
        
        let attributeString = NSMutableAttributedString(string: title,
                                                        attributes: yourAttributes)
        self.setAttributedTitle(attributeString, for: .normal)
    }
}

extension UITextField {
    func setBorders()  {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.2
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    func underlinedTextField()  {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
