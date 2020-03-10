//
//  pop.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/18/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

let pop = p()
class p:UIView{
    
    var body = UIView()
    
    func AppearChangePassWord(any:UIViewController,onCancel:@escaping ()-> Void, onYes:@escaping()->Void){
        self.body.isHidden = false
        let nibview = nibView(fileName: "changepassNib", ownerClass: any) as! changepassNib
        nibview.frame = any.view.frame
        any.view.addSubview(nibview)
        
        nibview.Input(onCanel: {
            onCancel()
        }) {
            onYes()
        }
        
        self.body = nibview
    }
    
    
    
    
    
    func AppearDistanceUnits(any:UIViewController){
        self.body.isHidden = false
        let nibview = nibView(fileName: "distanceUnitNib", ownerClass: any) as! distanceUnitNib
        nibview.frame = any.view.frame
        any.view.addSubview(nibview)
        
        
        
        self.body = nibview
    }
    
    func AppearSearchLocation(any:UIViewController,mapview:GMSMapView,AorB:String,Textfield:UITextField){
        self.body.isHidden = false
        let nibview = nibView(fileName: "searchlocationNib", ownerClass: any) as! searchlocationNib
        nibview.frame = any.view.frame
        any.view.addSubview(nibview)
        
        nibview.Input(any: any, map: mapview, LabelA: AorB, textfield: Textfield)
        
        self.body = nibview
    }
    
    
    func AppearPkr(any:UIViewController,textfield:UITextField) {
        self.body.isHidden = false
        let nibview = nibView(fileName: "pkrNib", ownerClass: any) as! pkrNib
        nibview.frame = any.view.frame
        any.view.addSubview(nibview)
        
        nibview.Input(textfield: textfield)
        
        
        self.body = nibview
    }
    
    
    func AppearComment(any:UIViewController,textfield:UITextField){
        self.body.isHidden = false
        let nibview = nibView(fileName: "commentNib", ownerClass: any) as! commentNib
        nibview.frame = any.view.frame
        any.view.addSubview(nibview)
        
        
        nibview.Input(textfield: textfield)
        
        self.body = nibview
    }
    
    
    func disAppear(){
        self.body.isHidden = true
        self.body.removeFromSuperview()
    }
    
    
    
    
    
}


