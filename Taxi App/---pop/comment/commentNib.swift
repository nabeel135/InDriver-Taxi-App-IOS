//
//  commentNib.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/19/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class commentNib: UIView {

    @IBOutlet weak var comment: UITextField!
    private var textfield = UITextField()
    
    @IBOutlet weak var morethan4passengers: UISwitch!
    
    @IBOutlet weak var childseat: UISwitch!
    
    
    func Input(textfield:UITextField){
        
        comment.becomeFirstResponder()
        comment.resignFirstResponder()
       
        morethan4passengers.isOn = rideRequestobj.morethan4passengers
        childseat.isOn = rideRequestobj.childseat
        
        self.textfield = textfield
        self.comment.addTarget(self, action: #selector(commentEditingchange), for: .editingChanged)
    }
    
    @objc private func commentEditingchange(){
        rideRequestobj.comment = comment.text!
        textfield.text = comment.text
    }

    @IBAction func close(_ sender: Any) {
        pop.disAppear()
    }
    
    @IBAction func done(_ sender: Any) {
        pop.disAppear()
    }
    
    @IBAction func morethan4passengers(_ sender: UISwitch) {
        rideRequestobj.morethan4passengers = sender.isOn
    }
    
    
    @IBAction func childseat(_ sender: UISwitch) {
        rideRequestobj.childseat = sender.isOn
    }
    
    
    
    
}

