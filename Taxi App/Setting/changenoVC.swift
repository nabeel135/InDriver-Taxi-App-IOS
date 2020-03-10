//
//  changenoVC.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/20/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit


class changenoVC: UIViewController {

    
    
    @IBOutlet weak var phoneno: UITextField!
    
    
    var variable:CGFloat = 0 {
        didSet{
            let ans:CGFloat = 2
            self.variable = ans*variable
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        variable = 5
        print(variable)
        
        phoneno.addTarget(self, action: #selector(countryCodeEditing(_:)), for: .editingChanged)
        
    }
    
    
    
    
    // MARK:- Buttons
    
    @objc func countryCodeEditing(_ sender:UITextField){
        
        print(sender.getText(sender))
        print(sender.isValid(sender))
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    
    
}





