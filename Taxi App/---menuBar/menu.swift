//
//  menu.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/17/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit


public let menu = mb()
public class mb {
    
    private let body = UIView()
    private var nib = UIView()
    
    func AppearUserMenu(any:UIViewController){
        body.frame = any.view.frame
        body.backgroundColor = .clear
        any.view.addSubview(body)
        
        let xx = (x/100)*80
        let nib = nibView(fileName: "menuNib", ownerClass: any) as! menuNib
        nib.frame = CGRect(x: -xx, y: 0, width: xx, height: y)
        body.addSubview(nib)
        
        self.nib = nib
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: [], animations: {
            self.body.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7)
            nib.frame.origin.x = 0
        })
        
        
        body.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(disAppear)))
        
        
        nib.Input(any: any,
                  imageURL: "imageurl",
                  userName: getString(key: usernamekey))
        
    }
    
    @objc func disAppear(){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 6, options: [], animations: {
            self.nib.frame.origin.x = -((x/100)*80)

        }) { _ in
            self.body.removeFromSuperview()
        }
    }
    
}
