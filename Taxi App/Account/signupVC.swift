//
//  signupVC.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/18/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit
import FlagPhoneNumber

class signupVC: UIViewController {

    
    
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var name: sbTextField!
    @IBOutlet weak var email: sbTextField!
    @IBOutlet weak var phoneno: FPNTextField!
    @IBOutlet weak var password: sbTextField!
    
    
    
    
    
    
    
    //MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    
    
    
    
    
    //MARK:-  Buttons
    @IBAction func loginpage(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func signupbtn(_ sender: Any) {
        if validation() {
            apiobj.signupApi(any: self,
                             name: name.text!,
                             email: email.text!,
                             mobile: phoneno.getText(phoneno),
                             password: password.text!,
                             utype: "0") {
                        self.present(storyboardView(boardName: "main", pageID: "loginVC"), animated: false)
            }
        }
    }
    
    func validation()-> Bool {
        if name.text!.isEmpty || email.text!.isEmpty || phoneno.text!.isEmpty || password.text!.isEmpty {
            self.showAlert(Title: "Message", Message: "Textfield should't be Empty!")
            return false
        }
        else{
            if phoneno.isValid(phoneno) {
                return true
            }else{
                self.showAlert(Title: "Message", Message: "Phone Number Should be valid!")
                return false
            }
        }
    }
    

}
