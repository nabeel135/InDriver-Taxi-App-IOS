//
//  changepassNib.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/18/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class changepassNib: UIView {

    
    private var oncancel:()->Void = {}
    private var onChange:()->Void = {}

    
    func Input(onCanel:@escaping ()->Void,onChange:@escaping ()->Void){
        self.oncancel = {onCanel()}
        self.onChange = {onChange()}
        
    }
    @IBAction func cancel(_ sender: Any) {
        self.oncancel()
    }
    
    @IBAction func changenumber(_ sender: Any) {
        self.onChange()
    }
    

}
