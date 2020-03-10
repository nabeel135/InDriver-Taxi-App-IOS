//
//  requestcellV.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/17/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class requestcellV: UIView {

    @IBOutlet weak var notification: UILabel!
    @IBOutlet weak var status: UILabel!
    
    
    func Input(Notification:String,status:String){
        
        self.notification.text = Notification
        self.status.text = status
        
    }

}
