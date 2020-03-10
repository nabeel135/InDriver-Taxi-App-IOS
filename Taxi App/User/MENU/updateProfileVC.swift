//
//  updateProfileVC.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/17/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class updateProfileVC: UIViewController {

    
    @IBOutlet weak var profilepic: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dateofbirth: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var ismale: UIButton!
    @IBOutlet weak var isfemale: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("gender: \(getString(key: usergenderkey))")
        
        ismale.isSelected = true
        isfemale.isSelected = false
        
        name.text = getString(key: usernamekey)
        email.text = getString(key: useremailkey)
        
        
    }
    

    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func uploadpic(_ sender: UIButton) {
        let picker = UI()
        picker.ImagePicker(any: self, imagview: profilepic, contentMode: .scaleAspectFill)
    }
    
    @IBAction func ismale(_ sender: Any) {
        ismale.isSelected = true
        isfemale.isSelected = false
    }
    
    @IBAction func isfemale(_ sender: Any) {
        ismale.isSelected = false
        isfemale.isSelected = true
    }
    
    @IBAction func save(_ sender: UIButton) {
        var gender = ""
        if ismale.isSelected {gender = "male"}
        else{gender = "female"}
        sender.bouncybutton {
            if self.validation() {
                apiobj.updateProfileAPI(any: self,
                                        userId: getString(key: useridkey),
                                        name: self.name.text!,
                                        email: self.email.text!,
                                        dateOfBirth: self.dateofbirth.text!,
                                        gender: gender,
                                        city: self.city.text!,
                                        image: self.profilepic.image!)
            }
        }
        
    }
    
    func validation()->Bool {
        if name.text!.isEmpty || email.text!.isEmpty || dateofbirth.text!.isEmpty || city.text!.isEmpty {
            self.showAlert(Title: "Message", Message: "Textfield should not be empty!")
            return false
        }else{return true}
    }

}
