//
//  IBDesignable.swift
//  Conektr
//
//  Created by Mr. Nabeel on 1/13/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit
import FlagPhoneNumber

@IBDesignable class sbButton: UIButton {

    @IBInspectable var border: CGFloat = 0.0 {
        didSet{
            self.layer.masksToBounds = true
            self.layer.borderWidth = border
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet{
            self.layer.masksToBounds = true
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            self.layer.masksToBounds = true
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var topLeft: Bool = false {
        didSet{
            let topleft = topLeft
            let topright = self.layer.maskedCorners.contains(.layerMaxXMinYCorner)
            let bottomleft = self.layer.maskedCorners.contains(.layerMinXMaxYCorner)
            let bottomRight = self.layer.maskedCorners.contains(.layerMaxXMaxYCorner)
            if topleft == false && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = []}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}

        }
    }
    
    @IBInspectable var topRight: Bool = false {
        didSet{
            let topleft = self.layer.maskedCorners.contains(.layerMinXMinYCorner)
            let topright = topRight
            let bottomleft = self.layer.maskedCorners.contains(.layerMinXMaxYCorner)
            let bottomRight = self.layer.maskedCorners.contains(.layerMaxXMaxYCorner)
            if topleft == false && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = []}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}

        }
    }
    
    @IBInspectable var bottomLeft: Bool = false {
        didSet{
            let topleft = self.layer.maskedCorners.contains(.layerMinXMinYCorner)
            let topright = self.layer.maskedCorners.contains(.layerMaxXMinYCorner)
            let bottomleft = bottomLeft
            let bottomRight = self.layer.maskedCorners.contains(.layerMaxXMaxYCorner)
            if topleft == false && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = []}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}

        }
    }
    
    @IBInspectable var bottomRight: Bool = false {
        didSet{
            let topleft = self.layer.maskedCorners.contains(.layerMinXMinYCorner)
            let topright = self.layer.maskedCorners.contains(.layerMaxXMinYCorner)
            let bottomleft = self.layer.maskedCorners.contains(.layerMinXMaxYCorner)
            let bottomright = bottomRight
            
            if topleft == false && topright == false && bottomleft == false && bottomright == false
                 {self.layer.maskedCorners = []}
            else if topleft == true && topright == false && bottomleft == false && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomright == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomright == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == false && bottomright == true
                 {self.layer.maskedCorners = [.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == false && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomright == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomright == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}

        }
    }
    
    
    
}

@IBDesignable class sbView: UIView{
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var ShadowColor: UIColor = .clear {
        didSet{
            self.layer.shadowColor = ShadowColor.cgColor
            self.layer.shadowOffset = .zero
        }
    }
    
    @IBInspectable var ShadowOpacity: Float = 1 {
        didSet{
            self.layer.shadowOpacity = ShadowOpacity
        }
    }
    
    @IBInspectable var ShadowRadius: CGFloat = 5 {
        didSet{
            self.layer.shadowRadius = ShadowRadius
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{

            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var topLeft: Bool = false {
        didSet{
            let topleft = topLeft
            let topright = self.layer.maskedCorners.contains(.layerMaxXMinYCorner)
            let bottomleft = self.layer.maskedCorners.contains(.layerMinXMaxYCorner)
            let bottomRight = self.layer.maskedCorners.contains(.layerMaxXMaxYCorner)
            if topleft == false && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = []}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}

        }
    }
    
    @IBInspectable var topRight: Bool = false {
        didSet{
            let topleft = self.layer.maskedCorners.contains(.layerMinXMinYCorner)
            let topright = topRight
            let bottomleft = self.layer.maskedCorners.contains(.layerMinXMaxYCorner)
            let bottomRight = self.layer.maskedCorners.contains(.layerMaxXMaxYCorner)
            if topleft == false && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = []}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}

        }
    }
    
    @IBInspectable var bottomLeft: Bool = false {
        didSet{
            let topleft = self.layer.maskedCorners.contains(.layerMinXMinYCorner)
            let topright = self.layer.maskedCorners.contains(.layerMaxXMinYCorner)
            let bottomleft = bottomLeft
            let bottomRight = self.layer.maskedCorners.contains(.layerMaxXMaxYCorner)
            if topleft == false && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = []}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}

        }
    }
    
    @IBInspectable var bottomRight: Bool = false {
        didSet{
            let topleft = self.layer.maskedCorners.contains(.layerMinXMinYCorner)
            let topright = self.layer.maskedCorners.contains(.layerMaxXMinYCorner)
            let bottomleft = self.layer.maskedCorners.contains(.layerMinXMaxYCorner)
            let bottomright = bottomRight
            
            if topleft == false && topright == false && bottomleft == false && bottomright == false
                 {self.layer.maskedCorners = []}
            else if topleft == true && topright == false && bottomleft == false && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomright == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomright == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == false && bottomright == true
                 {self.layer.maskedCorners = [.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == false && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomright == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomright == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}

        }
    }
    
    
}



@IBDesignable class sbLable: UILabel {
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet{
            self.layer.masksToBounds = true
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            self.layer.masksToBounds = true
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var topLeft: Bool = false {
        didSet{
            let topleft = topLeft
            let topright = self.layer.maskedCorners.contains(.layerMaxXMinYCorner)
            let bottomleft = self.layer.maskedCorners.contains(.layerMinXMaxYCorner)
            let bottomRight = self.layer.maskedCorners.contains(.layerMaxXMaxYCorner)
            if topleft == false && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = []}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}

        }
    }
    
    @IBInspectable var topRight: Bool = false {
        didSet{
            let topleft = self.layer.maskedCorners.contains(.layerMinXMinYCorner)
            let topright = topRight
            let bottomleft = self.layer.maskedCorners.contains(.layerMinXMaxYCorner)
            let bottomRight = self.layer.maskedCorners.contains(.layerMaxXMaxYCorner)
            if topleft == false && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = []}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}

        }
    }
    
    @IBInspectable var bottomLeft: Bool = false {
        didSet{
            let topleft = self.layer.maskedCorners.contains(.layerMinXMinYCorner)
            let topright = self.layer.maskedCorners.contains(.layerMaxXMinYCorner)
            let bottomleft = bottomLeft
            let bottomRight = self.layer.maskedCorners.contains(.layerMaxXMaxYCorner)
            if topleft == false && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = []}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomRight == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}

        }
    }
    
    @IBInspectable var bottomRight: Bool = false {
        didSet{
            let topleft = self.layer.maskedCorners.contains(.layerMinXMinYCorner)
            let topright = self.layer.maskedCorners.contains(.layerMaxXMinYCorner)
            let bottomleft = self.layer.maskedCorners.contains(.layerMinXMaxYCorner)
            let bottomright = bottomRight
            
            if topleft == false && topright == false && bottomleft == false && bottomright == false
                 {self.layer.maskedCorners = []}
            else if topleft == true && topright == false && bottomleft == false && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomright == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomright == false
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomright == false
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == false && bottomright == true
                 {self.layer.maskedCorners = [.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == false && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == false && bottomright == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == false && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == false && bottomleft == true && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == false && bottomleft == true && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == false && topright == true && bottomleft == true && bottomright == true
                 {self.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}
            else if topleft == true && topright == true && bottomleft == true && bottomright == true
                 {self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]}

        }
    }
}




@IBDesignable class sbImageView: UIImageView{
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            self.layer.masksToBounds = true
            self.layer.cornerRadius = cornerRadius
        }
    }
}


@IBDesignable class sbTextField: UITextField{
    
    var isPhoneNo:FPNTextField = FPNTextField() {
        didSet{
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = .clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}


@IBDesignable class sbTextView: UITextView{
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
