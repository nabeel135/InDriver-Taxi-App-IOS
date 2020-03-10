//
//  pkrNib.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/19/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class pkrNib: UIView {

    @IBOutlet weak var pkr: UITextField!
    
    private var textfield = UITextField()
    func Input(textfield:UITextField) {
        
        pkr.becomeFirstResponder()
        pkr.resignFirstResponder()
        
        self.textfield = textfield
        self.pkr.addTarget(self, action: #selector(pkreditchange), for: .editingChanged)
    }

    
    
    @objc private func pkreditchange(){
        rideRequestobj.pkr = pkr.text!
        self.textfield.text = pkr.text
    }
    
    
    @IBAction private func close(_ sender: Any) {
        pop.disAppear()
    }
    
    
    @IBAction private func done(_ sender: Any) {
        pop.disAppear()
    }
    
    
}
